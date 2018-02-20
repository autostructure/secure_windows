require 'rexml/document'
include REXML
Puppet::Type.type(:applockerpolicy).provide(:powershell) do
  desc 'Use the Windows O/S powershell.exe tool to manage AppLocker policies.'
  # @doc = 'Use the Windows O/S powershell.exe tool to manage AppLocker policies.'
  # Error: /Stage[main]/Profile::Secure_server/Applockerpolicy[Test Policy 1]: Could not evaluate: undefined method `desc' for Applockerpolicy[Test Policy 1](provider=powershell):Puppet::Type::Applockerpolicy::ProviderPowershell
  # desc 'Use the Windows O/S powershell.exe tool to manage AppLocker policies.'

  mk_resource_methods

  confine :kernel => :windows
  commands :ps => File.exist?("#{ENV['SYSTEMROOT']}\\system32\\windowspowershell\\v1.0\\powershell.exe") ? "#{ENV['SYSTEMROOT']}\\system32\\windowspowershell\\v1.0\\powershell.exe" : 'powershell.exe'
  # commands :ps => 'c:\windows\system32\windowspowershell\v1.0\powershell.exe'

  def initialize(value = {})
    super(value)
    @property_flush = {}
  end

  # This method exists to map the dscl values to the correct Puppet
  # properties. This stays relatively consistent, but who knows what
  # Apple will do next year...
  def self.xml2resource_attribute_map
    {
      'Type'            => :type,
      'EnforcementMode' => :enforcementmode,
      'Name'            => :name,
      'Description'     => :description,
      'Id'              => :id,
      'UserOrGroupSid'  => :user_or_group_sid,
      'Action'          => :action,
    }
  end

  def self.resource2xml_attribute_map
    @resource2xml_attribute_map ||= xml2resource_attribute_map.invert
  end

  def self.instances
    Puppet.debug 'powershell.rb::instances called.'
    provider_array = []
    # xmlstr = ps("Get-AppLockerPolicy -Domain -XML -Ldap \'LDAP://WIN-HEMGTARNJON.AUTOSTRUCTURE.IO/CN={78E10B45-DBC6-4880-9123-D78BF6F72C0E},CN=Policies,CN=System,DC=autostructure,DC=io\'")
    # xmlstr = File.read './examples/applocker.xml'
    # xmlstr = File.read 'C:/Windows/Temp/applocker.xml'
    xml_string = ps('Get-AppLockerPolicy -Effective -Xml')
    xml_doc = Document.new xml_string
    Puppet.debug 'powershell.rb::self.instances::xml_string:'
    Puppet.debug xml_string
    Puppet.debug 'rules...'
    xml_doc.root.each_element('RuleCollection') do |rc|
      # REXML Attributes are returned with the attribute and its value, including delimiters.
      # e.g. <RuleCollection Type='Exe' ...> returns "Type='Exe'".
      # So, the value must be parsed using slice.
      rule_collection_type = rc.attribute('Type').to_string.slice(/=['|"]*(.*)['|"]/,1)
      rule_collection_enforcementmode = rc.attribute('EnforcementMode').to_string.slice(/=['|"]*(.*)['|"]/,1)
      # must loop through each type of rule tag, I couldn't find how to grab tag name from REXML :/
      rc.each_element('FilePathRule') do |fpr|
        rule = {
          ensure:            :present,
          rule_type:         :file,
          type:              rule_collection_type,
          enforcementmode:   rule_collection_enforcementmode,
          action:            fpr.attribute('Action').to_string.slice(/=['|"]*(.*)['|"]/,1),
          name:              fpr.attribute('Name').to_string.slice(/=['|"]*(.*)['|"]/,1),
          description:       fpr.attribute('Description').to_string.slice(/=['|"]*(.*)['|"]/,1),
          id:                fpr.attribute('Id').to_string.slice(/=['|"]*(.*)['|"]/,1),
          user_or_group_sid: fpr.attribute('UserOrGroupSid').to_string.slice(/=['|"]*(.*)['|"]/,1),
        }
        # then loop thru conditions exceptions
        # TODO: conditions/exceptions coding
        # push to policy array after xml tree loaded
        Puppet.debug rule
        provider_array.push(self.new(rule))
      end
    end
    provider_array
  end

  def create
    Puppet.debug 'powershell.rb::create called.'
    # Write a test xml file to windows temp dir to be used by powershell cmdlet (doesn't accept an xml string, only a file path).
    test_xml = "<AppLockerPolicy Version='1'>
  <RuleCollection Type='#{@resource[:type]}' EnforcementMode='#{@resource[:enforcementmode]}'>
    <FilePathRule Id='#{@resource[:id]}' Name='#{@resource[:name]}' Description='#{@resource[:description]}' UserOrGroupSid='S-1-1-0' Action='Allow'>
      <Conditions>
        <FilePathCondition Path='%WINDIR%\\Temp\\*'/>
      </Conditions>
    </FilePathRule>
 </RuleCollection>
</AppLockerPolicy>"
    testfile = File.open('c:\windows\temp\applockerpolicy.xml', 'w')
    testfile.puts test_xml
    testfile.close
    #
    # Set-AppLockerPolicy -Merge -XMLPolicy C:\applockerpolicy.xml -LDAP "LDAP://WIN-HEMGTARNJON.AUTOSTRUCTURE.IO/CN={78E10B45-DBC6-4880-9123-D78BF6F72C0E},CN=Policies,CN=System,DC=autostructure,DC=io"
    # NOTE: The '-Merge' option is very important, use it or it will purge any rules not defined in the Xml.
    ps('Set-AppLockerPolicy -Merge -XMLPolicy C:\Windows\Temp\applockerpolicy.xml')
    # testfile.unlink
    File.unlink('c:\windows\temp\applockerpolicy.xml')
  end

  def destroy
    Puppet.debug 'powershell.rb::destroy called.'
  end

  def exists?
    Puppet.debug 'powershell.rb::exists?'
    @property_hash[:ensure] = :present
  end

  # Prefetching is necessary to use @property_hash inside any setter methods.
  # self.prefetch uses self.instances to gather an array of user instances
  # on the system, and then populates the @property_hash instance variable
  # with attribute data for the specific instance in question (i.e. it
  # gathers the 'is' values of the resource into the @property_hash instance
  # variable so you don't have to read from the system every time you need
  # to gather the 'is' values for a resource. The downside here is that
  # populating this instance variable for every resource on the system
  # takes time and front-loads your Puppet run.
  def self.prefetch(resources)
    Puppet.debug 'powershell.rb::prefetch called.'
    # the resources object that contains all resources in the catalog.
    instances.each do |provider_instance|
      if resource = resources[provider_instance.name]
        resource.provider = provider_instance
      end
    end
  end

  # called when a property is changed.
  # check @property_flush hash for keys to changed properties.
  # at the end of flush, update the @property_hash from the 'is' to 'should' values.
  def flush
    Puppet.debug 'powershell.rb::flush called.'
    # set policy
    #set @property_hash = (update hash from is to should value)
  end
end
