require 'rexml/document'
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
    xmlstr = ps('Get-AppLockerPolicy -Effective -Xml')
    Puppet.debug 'powershell.rb::self.instances::xmlstr: '
    Puppet.debug xmlstr
    xml = Document.new xmlstr
    xml.root.elements.each('RuleCollection') do |rc|
      rc.elements.each('FileHashRule') do |fhr|
        puts "AppLockerPolicy {\"#{fhr.attributes['Name']}\":"
        puts '  ensure            => present'
        puts '  rule_type         => hash'
        puts "  collection_type   => #{rc.attributes['Type']}"
        puts "  enforcement_mode  => #{rc.attributes['EnforcementMode']}"
        puts "  name              => \"#{fhr.attributes['Name']}\""
        puts "  id                => #{fhr.attributes['Id']}"
        puts "  description       => \"#{fhr.attributes['Description']}\""
        puts "  user_or_group_sid => #{fhr.attributes['UserOrGroupSid']}"
        puts "  action            => #{fhr.attributes['Action']}"
        puts '}'
        puts
      end
      rc.elements.each('FilePathRule') do |fpr|
        puts "AppLockerPolicy {\"#{fpr.attributes['Name']}\":"
        puts '  ensure            => present'
        puts '  rule_type         => file'
        puts "  collection_type   => #{rc.attributes['Type']}"
        puts "  enforcement_mode  => #{rc.attributes['EnforcementMode']}"
        puts "  name              => \"#{fpr.attributes['Name']}\""
        puts "  id                => #{fpr.attributes['Id']}"
        puts "  description       => \"#{fpr.attributes['Description']}\""
        puts "  user_or_group_sid => #{fpr.attributes['UserOrGroupSid']}"
        puts "  action            => #{fpr.attributes['Action']}"
        puts '}'
        puts
      end
      rc.elements.each('FilePublisherRule') do |pr|
        puts "AppLockerPolicy {\"#{pr.attributes['Name']}\":"
        puts '  ensure            => present'
        puts '  rule_type         => publisher'
        puts "  collection_type   => #{rc.attributes['Type']}"
        puts "  enforcement_mode  => #{rc.attributes['EnforcementMode']}"
        puts "  name              => \"#{pr.attributes['Name']}\""
        puts "  id                => #{pr.attributes['Id']}"
        puts "  description       => \"#{pr.attributes['Description']}\""
        puts "  user_or_group_sid => #{pr.attributes['UserOrGroupSid']}"
        puts "  action            => #{pr.attributes['Action']}"
        puts '}'
        puts
      end
    end
  end

  def create
    # Write a test xml file to windows temp dir to be used by powershell cmdlet (doesn't accept an xml string, only a file path).
    testxml = "<AppLockerPolicy Version='1'>
  <RuleCollection Type='#{@resource[:type]}' EnforcementMode='#{@resource[:enforcement_mode]}'>
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

  def collection_type
    puts 'powershell.rb::collection_type'
    # desc 'The type of AppLocker collection [Appx, Dll, Exe, Msi, Script].'
    @resource[:type]
  end

  def enforcement_mode
    puts 'powershell.rb::enforcement_mode'
    # desc 'Is the rule enforced? [Enabled, Disabled, NotConfigured]'
    @resource[:enforcement_mode]
  end

  def enforcement_mode=(value)
    # desc 'Is the rule enforced? [Enabled, Disabled, NotConfigured]'
    puts 'setter enforcement_mode='
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
