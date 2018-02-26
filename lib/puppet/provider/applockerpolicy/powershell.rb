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

  def tempfile
    'c:\windows\temp\applockerpolicy.xml.tmp'
  end

  def mergeLDAPPolicies
  end

  def xml_policy_passthrough
    # create param => xml_policy_filepath
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
        # push new Puppet::Provider object into an array after property hash created.
        Puppet.debug rule
        provider_array.push(self.new(rule))
      end
    end
    provider_array
  end

  def create
    Puppet.debug 'powershell.rb::create called.'
    xml_create = "<AppLockerPolicy Version='1'>
  <RuleCollection Type='#{@resource[:type]}' EnforcementMode='#{@resource[:enforcementmode]}'>
    <FilePathRule Id='#{@resource[:id]}' Name='#{@resource[:name]}' Description='#{@resource[:description]}' UserOrGroupSid='#{@resource[:user_or_group_sid]}' Action='#{@resource[:action]}'>
      <Conditions>
        <FilePathCondition Path='%WINDIR%\\Temp\\*'/>
      </Conditions>
    </FilePathRule>
 </RuleCollection>
</AppLockerPolicy>"
    Puppet.debug 'powershell.rb::create xml_create='
    Puppet.debug xml_create
    Puppet.debug "powershell.rb::create creating temp file => #{tempfile}"
    # Write a temp xml file to windows temp dir to be used by powershell cmdlet (doesn't accept an xml string, only a file path).
    testfile = File.open(tempfile, 'w')
    testfile.puts xml_create
    testfile.close
    # NOTE: Used Set-AppLockerPolicy because New-AppLockerPolicy had an unusual interface.
    # NOTE: The '-Merge' option is very important, use it or it will purge any rules not defined in the Xml.
    ps("Set-AppLockerPolicy -Merge -XMLPolicy #{tempfile}")
    File.unlink(tempfile)
    Puppet.debug "deleted #{tempfile}"
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
    self.set
    # update @property_hash
    # set @property_hash = @property_hash[]
  end

  def set
    Puppet.debug 'powershell.rb::set'
    # read all xml
    xml_all_policies = ps('Get-AppLockerPolicy -Effective -Xml')
    # build set xml
    xml_should = "<FilePathRule Id='#{@resource[:id]}' Name='#{@resource[:name]}' Description='#{@resource[:description]}' UserOrGroupSid='#{@resource[:user_or_group_sid]}' Action='#{@resource[:action]}'>
      <Conditions>
        <FilePathCondition Path='%WINDIR%\\Temp\\*'/>
      </Conditions>
    </FilePathRule>"
    # replace xml tag
    # XPath.each( doc, "//price") { |element| puts element.text }
    xml_is = XPath.match(xml_all_policies, '//FilePathRule', {}, 'Id' => @resource[:id])
    # xml_is = xml_all_policies.xpath('//FilePathRule', 'Id' => @resource[:id])
    Puppet.debug 'powershell.rb::set (is) xml_is='
    Puppet.debug xml_is
    xml_is.content = xml_should
    Puppet.debug 'powershell.rb::set (should) xml_is='
    Puppet.debug xml_is
    Puppet.debug 'powershell.rb::set (should) xml_all_policies='
    Puppet.debug xml_all_policies
    Puppet.debug "powershell.rb::set creating temp file => #{tempfile}"
    xmlfile = File.open(tempfile, 'w')
    xmlfile.puts xml_all_policies
    xmlfile.close
    # Set-AppLockerPolicy (no merge)
    # NOTE: The Set-AppLockerPolicy powershell command would not work with the '-Merge' option.
    ps("Set-AppLockerPolicy -XMLPolicy #{tempfile}")
    File.unlink(tempfile)
    Puppet.debug "deleted #{tempfile}"
  end

  def clear
    Puppet.debug 'powershell.rb::clear'
    xml_clear_all_rules = "<AppLockerPolicy Version=\"1\">
  <RuleCollection Type=\"Appx\" EnforcementMode=\"NotConfigured\" />
  <RuleCollection Type=\"Exe\" EnforcementMode=\"NotConfigured\" />
  <RuleCollection Type=\"Msi\" EnforcementMode=\"NotConfigured\" />
  <RuleCollection Type=\"Script\" EnforcementMode=\"NotConfigured\" />
  <RuleCollection Type=\"Dll\" EnforcementMode=\"NotConfigured\" />
</AppLockerPolicy>"
    clearfile = File.open('c:\windows\temp\applockerpolicy.xml', 'w')
    clearfile.puts xml_clear_all_rules
    clearfile.close
    ps('Set-AppLockerPolicy -XMLPolicy C:\Windows\Temp\applockerpolicy.xml')
    File.unlink('c:\windows\temp\applockerpolicy.xml')
  end
end
