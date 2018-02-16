require 'puppet'
require 'rexml/document'
include REXML
Puppet::Type.type(:applockerpolicy).provide(:powershell) do
  @doc = 'Use the Windows O/S powershell.exe tool to manage AppLocker policies.'
  # Error: /Stage[main]/Profile::Secure_server/Applockerpolicy[Test Policy 1]: Could not evaluate: undefined method `desc' for Applockerpolicy[Test Policy 1](provider=powershell):Puppet::Type::Applockerpolicy::ProviderPowershell
  # desc 'Use the Windows O/S powershell.exe tool to manage AppLocker policies.'

  confine :kernel => :windows
  commands :ps => File.exist?("#{ENV['SYSTEMROOT']}\\system32\\windowspowershell\\v1.0\\powershell.exe") ? "#{ENV['SYSTEMROOT']}\\system32\\windowspowershell\\v1.0\\powershell.exe" : 'powershell.exe'
  # commands :ps => 'c:\windows\system32\windowspowershell\v1.0\powershell.exe'

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
    puts 'powershell.rb::instances called.'
    # xmlstr = ps("Get-AppLockerPolicy -Domain -XML -Ldap \'LDAP://WIN-HEMGTARNJON.AUTOSTRUCTURE.IO/CN={78E10B45-DBC6-4880-9123-D78BF6F72C0E},CN=Policies,CN=System,DC=autostructure,DC=io\'")
    # xmlstr = File.read './examples/applocker.xml'
    # xmlstr = File.read 'C:/Windows/Temp/applocker.xml'
    # applocker_policies = []
    xml_string = ps('Get-AppLockerPolicy -Effective -Xml')
    xml_doc = Document.new xml_string
    Puppet.debug 'powershell.rb::self.instances::xml_string:'
    Puppet.debug xml_string
    xml_doc.root.elements.each('RuleCollection') do |rc|
      # REXML Attributes are returned with the attribute and its value, including delimiters.
      # e.g. <RuleCollection Type='Exe' ...> returns "Type='Exe'".
      # So, the value must be parsed using slice.
      rule_collection_type = rc.attribute('Type').to_string.slice(/=['|"]*(.*)['|"]/,1)
      rule_collection_enforcementmode = rc.attribute('EnforcementMode').to_string.slice(/=['|"]*(.*)['|"]/,1)
      # must loop through each type of rule tag, I couldn't find how to grab tag name from REXML :/
      rc.each_element('FilePathRule') do |fpr|
        rule = {}
        rule[:ensure]            = :present
        rule[:provider]          = :directoryservice
        rule[:rule_type]         = :file
        rule[:type]              = rule_collection_type
        rule[:enforcementmode]   = rule_collection_enforcementmode
        rule[:name]              = fpr.attribute('Name').to_string.slice(/=['|"]*(.*)['|"]/,1)
        rule[:description]       = fpr.attribute('Description').to_string.slice(/=['|"]*(.*)['|"]/,1)
        rule[:id]                = fpr.attribute('Id').to_string.slice(/=['|"]*(.*)['|"]/,1)
        rule[:user_or_group_sid] = fpr.attribute('UserOrGroupSid').to_string.slice(/=['|"]*(.*)['|"]/,1)
        rule[:action]            = fpr.attribute('Action').to_string.slice(/=['|"]*(.*)['|"]/,1)
        #rule[:user]              = :Everyone      # 'Everyone'
        #rule[:prefix]            = :autostructure # 'autostructure'
        # then loop thru conditions exceptions
        # TODO: conditions/exceptions coding
        # push to policy array after xml tree loaded
        # applocker_policies << rule
        self.new(rule)
      end
    end
  end

  def create
    puts 'powershell.rb::create called.'
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
    testfile = File.open('C:\Windows\Temp\applockerpolicy.xml', 'w')
    testfile.puts test_xml
    testfile.close
    # Set-AppLockerPolicy -Merge -XMLPolicy C:\applockerpolicy.xml -LDAP "LDAP://WIN-HEMGTARNJON.AUTOSTRUCTURE.IO/CN={78E10B45-DBC6-4880-9123-D78BF6F72C0E},CN=Policies,CN=System,DC=autostructure,DC=io"
    # NOTE: The '-Merge' option is very important, use it or it will purge any rules not defined in the Xml.
    ps('Set-AppLockerPolicy -Merge -XMLPolicy C:\Windows\Temp\applockerpolicy.xml')
    # testfile.delete
  end

  def destroy
    puts 'powershell.rb::destroy called.'
  end

  def exists?
    puts 'powershell.rb::exists?'
    false
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
    puts 'powershell.rb::prefetch called.'
    instances.each do |prov|
      if @resource = resources[prov.name]
        @resource.provider = prov
      end
    end
  end

  def flush
    puts 'powershell.rb::flush called.'
  end


  # setters and getters
  def name
    puts 'powershell.rb::name'
    @resource[:name]
  end

  def rule_type
    puts 'powershell.rb::rule_type'
    # desc 'The type of AppLocker rule [file, hash, publisher].'
    @resource[:rule_type]
  end

  def type
    puts 'powershell.rb::type'
    # desc 'The type of AppLocker collection [Appx, Dll, Exe, Msi, Script].'
    @resource[:type]
  end

  def enforcementmode
    puts 'powershell.rb::enforcementmode'
    # desc 'Is the rule enforced? [Enabled, Disabled, NotConfigured]'
    @resource[:enforcementmode]
  end

  def enforcementmode=(value)
    # desc 'Is the rule enforced? [Enabled, Disabled, NotConfigured]'
    puts 'setter enforcementmode='
    puts value
  end

  def id
    puts 'powershell.rb::id'
    # desc 'The AppLocker rule identifier.'
    @resource[:id]
  end

  def description
    puts 'powershell.rb::description'
    # desc 'The AppLocker rule description.'
    @resource[:description]
  end

  def user_or_group_sid
    puts 'powershell.rb::uid-or-sid'
    # desc 'The AppLocker user or group system identifier.'
    @resource[:user_or_group_sid]
  end

  def prefix
    puts 'powershell.rb::prefix'
    @resource[:prefix]
  end

  def user
    puts 'powershell.rb::user'
    @resource[:user]
  end

end
