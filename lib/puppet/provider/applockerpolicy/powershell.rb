require 'rexml/document'
require 'active_support'
include REXML
Puppet::Type.type(:applockerpolicy).provide(:powershell) do
  @doc = 'Use the Windows O/S powershell.exe tool to manage AppLocker policies.'
  # Error: /Stage[main]/Profile::Secure_server/Applockerpolicy[Test Policy 1]: Could not evaluate: undefined method `desc' for Applockerpolicy[Test Policy 1](provider=powershell):Puppet::Type::Applockerpolicy::ProviderPowershell
  # desc 'Use the Windows O/S powershell.exe tool to manage AppLocker policies.'

  confine :kernel => :windows
  commands :ps => File.exist?("#{ENV['SYSTEMROOT']}\\system32\\windowspowershell\\v1.0\\powershell.exe") ? "#{ENV['SYSTEMROOT']}\\system32\\windowspowershell\\v1.0\\powershell.exe" : 'powershell.exe'
  # commands :ps => 'c:\windows\system32\windowspowershell\v1.0\powershell.exe'
  def self.instances
    # xmlstr = ps("Get-AppLockerPolicy -Domain -XML -Ldap \'LDAP://WIN-HEMGTARNJON.AUTOSTRUCTURE.IO/CN={78E10B45-DBC6-4880-9123-D78BF6F72C0E},CN=Policies,CN=System,DC=autostructure,DC=io\'")
    # xmlstr = File.read './examples/applocker.xml'
    # xmlstr = File.read 'C:/Windows/Temp/applocker.xml'
    xml_string = ps('Get-AppLockerPolicy -Effective -Xml')
    Puppet.debug 'powershell.rb::self.instances::xml_string: '
    Puppet.debug xml_string
    object_hash = Hash.from_xml(xml_string)
    Puppet.debug 'object_hash='
    Puppet.debug object_hash
    puts object_hash
  end

  def create
    # Write a test xml file to windows temp dir to be used by powershell cmdlet (doesn't accept an xml string, only a file path).
    testxml = "<AppLockerPolicy Version='1'>
  <RuleCollection Type='#{@resource[:type]}' EnforcementMode='#{@resource[:enforcementmode]}'>
    <FilePathRule Id='12345678-9012-3456-7890-123456789012' Name='#{@resource[:name]}' Description='#{@resource[:description]}' UserOrGroupSid='S-1-1-0' Action='Allow'>
      <Conditions>
        <FilePathCondition Path='%WINDIR%\\Temp\\*'/>
      </Conditions>
    </FilePathRule>
 </RuleCollection>
</AppLockerPolicy>"

    puts 'testxml='
    puts testxml
    puts
    testfile = File.open('C:\Windows\Temp\applockerpolicy.xml', 'w')
    testfile.puts testxml
    testfile.close
    # Set-AppLockerPolicy -Merge -XMLPolicy C:\applockerpolicy.xml -LDAP "LDAP://WIN-HEMGTARNJON.AUTOSTRUCTURE.IO/CN={78E10B45-DBC6-4880-9123-D78BF6F72C0E},CN=Policies,CN=System,DC=autostructure,DC=io"
    # NOTE: The '-Merge' option is very important, use it or it will purge any rules not defined in the Xml.
    ps('Set-AppLockerPolicy -Merge -XMLPolicy C:\Windows\Temp\applockerpolicy.xml')
    # testfile.delete
  end

  def exists?
    puts 'powershell.rb::exists?'
    false
  end

  def destroy
    puts 'powershell.rb::destroy called.'
  end

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

  # def self.prefetch(resources) end
end
