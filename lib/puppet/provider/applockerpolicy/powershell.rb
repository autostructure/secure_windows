require 'rexml/document'
include REXML
Puppet::Type.type(:applockerpolicy).provide(:powershell) do
  desc "Use the Windows O/S powershell.exe tool to manage AppLocker policies."
  # windows only
  confine :kernel => :windows
  commands :ps =>
    if File.exist?("#{ENV['SYSTEMROOT']}\\sysnative\\WindowsPowershell\\v1.0\\powershell.exe")
      "#{ENV['SYSTEMROOT']}\\sysnative\\WindowsPowershell\\v1.0\\powershell.exe"
    elsif File.exist?("#{ENV['SYSTEMROOT']}\\system32\\WindowsPowershell\\v1.0\\powershell.exe")
      "#{ENV['SYSTEMROOT']}\\system32\\WindowsPowershell\\v1.0\\powershell.exe"
    else
      'powershell.exe'
    end

  # XML hierarchy...
  # AppLockerPolicy
  # - RuleCollection
  #   - FilePathRule
  #     - Conditions/Exceptions
  #       - FilePathCondition
  def self.instances
    puts 'Autostructure: Starting self analysis...'
    # xmlstr = ps("Get-AppLockerPolicy -Domain -XML -Ldap \'LDAP://WIN-HEMGTARNJON.AUTOSTRUCTURE.IO/CN={78E10B45-DBC6-4880-9123-D78BF6F72C0E},CN=Policies,CN=System,DC=autostructure,DC=io\'")
    xmlstr = File.read './examples/applocker.xml'
    xml = Document.new xmlstr
    puts 'Autostructure: xmlstr...'
    xml.root.elements.each('RuleCollection') do |rc|
      puts 'Autostructure: rc'
      rc.elements[0].each('FileHashRule') do |fhr|
        puts 'Autostructure: fhr(in)'
        puts "AppLockerPolicy {'#{fhr['Name']}':"
        puts '  rule_type         => hash'
        puts "  collection_type   => #{rc['Type']}"
        puts "  enforcement_mode  => #{rc['EnforcementMode']}"
        puts "  name              => '#{fhr['Name']}'"
        puts "  id                => #{fhr['Id']}"
        puts "  description       => '#{fhr['Description']}'"
        puts "  user_or_group_sid => #{fhr['UserOrGroupSid']}"
        puts "  action            => #{fhr['Action']}"
        puts '}'
        puts
      end
      puts 'Autostructure: fpr'
      rc.elements[0].each('FilePathRule') do |fpr|
        puts 'Autostructure: fpr(in)'
        puts fpr.to_s
        puts "AppLockerPolicy {'#{fpr['Name']}':"
        puts '  rule_type         => file'
        puts "  collection_type   => #{rc['Type']}"
        puts "  enforcement_mode  => #{rc['EnforcementMode']}"
        puts "  name              => '#{fpr['Name']}'"
        puts "  id                => #{fpr['Id']}"
        puts "  description       => '#{fpr['Description']}'"
        puts "  user_or_group_sid => #{fpr['UserOrGroupSid']}"
        puts "  action            => #{fpr['Action']}"
        puts '}'
        puts
      end
      puts 'Autostructure: pr'
      rc.elements[0].each('FilePublisherRule') do |pr|
        puts 'Autostructure: pr(0)'
        puts pr.to_s
        puts "AppLockerPolicy {'#{pr['Name']}':"
        puts 'Autostructure: pr(1)'
        puts '  rule_type         => publisher'
        puts 'Autostructure: pr(2)'
        puts "  collection_type   => #{rc['Type']}"
        puts 'Autostructure: pr(3)'
        puts "  enforcement_mode  => #{rc['EnforcementMode']}"
        puts 'Autostructure: pr(4)'
        puts "  name              => '#{pr['Name']}'"
        puts 'Autostructure: pr(5)'
        puts "  id                => #{pr['Id']}"
        puts 'Autostructure: pr(6)'
        puts "  description       => '#{pr['Description']}'"
        puts 'Autostructure: pr(7)'
        puts "  user_or_group_sid => #{pr['UserOrGroupSid']}"
        puts 'Autostructure: pr(8)'
        puts "  action            => #{pr['Action']}"
        puts 'Autostructure: pr(9)'
        puts '}'
        puts
      end
    end
  end

  def create
    # New-AppLockerPolicy -RuleType Publisher, Hash -User Everyone -RuleNamePrefix System32
    # an array to store powershell command
    array = []
    # raise an error if no rule_type specified...
    if @resource[:prefix].to_s.strip.empty?
      raise Puppet::Error, 'AppLockerPolicy must be supplied a rule_type = [file, hash, publisher]'
    end
    # add cmd and options...
    array << "New-AppLockerPolicy '#{resource[:name]}'"
    # array << "Import-Module ServerManager; Install-WindowsFeature #{resource[:name]}"
    array << "-RuleType #{resource[:rule_type]}"
    array << "-User #{resource[:user]}" unless @resource[:user].to_s.strip.empty?
    array << "-RuleNamePrefix #{resource[:prefix]}" unless @resource[:prefix].to_s.strip.empty?
    # show the created ps string, get the result, show the result (debug)
    Puppet.debug "Powershell create command is '#{array}'"
    # TODO: dont enable creation yet...
    # result = ps(array.join(' '))
    # Puppet.debug "Powershell create response was '#{result}'"
  end

  def exists?
    # lookup resource in applocker
  end

  def destroy; end

  # def self.prefetch(resources) end
end
