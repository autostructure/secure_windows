require 'rexml/document'
include REXML
Puppet::Type.type(:applockerpolicy).provide(:powershell) do
  desc 'Use the Windows O/S powershell.exe tool to manage AppLocker policies.'

  psstring =
    if File.exist?("#{ENV['SYSTEMROOT']}\\sysnative\\WindowsPowershell\\v1.0\\powershell.exe")
      "#{ENV['SYSTEMROOT']}\\sysnative\\WindowsPowershell\\v1.0\\powershell.exe"
    elsif File.exist?("#{ENV['SYSTEMROOT']}\\system32\\WindowsPowershell\\v1.0\\powershell.exe")
      "#{ENV['SYSTEMROOT']}\\system32\\WindowsPowershell\\v1.0\\powershell.exe"
    else
      'powershell.exe'
    end

  # windows only
  confine :kernel => :windows
  #commands :ps => "c:\\Windows\\system32\\WindowsPowerShell\\v1.0\\powershell.exe"
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
  #       - FilePathCondition/FilePublisherCondition
  def self.instances
    # xmlstr = ps("Get-AppLockerPolicy -Domain -XML -Ldap \'LDAP://WIN-HEMGTARNJON.AUTOSTRUCTURE.IO/CN={78E10B45-DBC6-4880-9123-D78BF6F72C0E},CN=Policies,CN=System,DC=autostructure,DC=io\'")
    # xmlstr = File.read './examples/applocker.xml'
    # Get-AppLockerPolicy [-Local] [-Xml] [<CommonParameters>]
    puts psstring
    xmlstr = File.read 'C:/Windows/Temp/applocker.xml'
    xml = Document.new xmlstr
    xml.root.elements.each('RuleCollection') do |rc|
      rc.elements.each('FileHashRule') do |fhr|
        puts "AppLockerPolicy {'#{fhr.attributes['Name']}':"
        puts '  ensure            => present'
        puts '  rule_type         => hash'
        puts "  collection_type   => #{rc.attributes['Type']}"
        puts "  enforcement_mode  => #{rc.attributes['EnforcementMode']}"
        puts "  name              => '#{fhr.attributes['Name']}'"
        puts "  id                => #{fhr.attributes['Id']}"
        puts "  description       => '#{fhr.attributes['Description']}'"
        puts "  user_or_group_sid => #{fhr.attributes['UserOrGroupSid']}"
        puts "  action            => #{fhr.attributes['Action']}"
        puts '}'
        puts
      end
      rc.elements.each('FilePathRule') do |fpr|
        puts "AppLockerPolicy {'#{fpr.attributes['Name']}':"
        puts '  ensure            => present'
        puts '  rule_type         => file'
        puts "  collection_type   => #{rc.attributes['Type']}"
        puts "  enforcement_mode  => #{rc.attributes['EnforcementMode']}"
        puts "  name              => '#{fpr.attributes['Name']}'"
        puts "  id                => #{fpr.attributes['Id']}"
        puts "  description       => '#{fpr.attributes['Description']}'"
        puts "  user_or_group_sid => #{fpr.attributes['UserOrGroupSid']}"
        puts "  action            => #{fpr.attributes['Action']}"
        puts '}'
        puts
      end
      rc.elements.each('FilePublisherRule') do |pr|
        puts "AppLockerPolicy {'#{pr.attributes['Name']}':"
        puts '  ensure            => present'
        puts '  rule_type         => publisher'
        puts "  collection_type   => #{rc.attributes['Type']}"
        puts "  enforcement_mode  => #{rc.attributes['EnforcementMode']}"
        puts "  name              => '#{pr.attributes['Name']}'"
        puts "  id                => #{pr.attributes['Id']}"
        puts "  description       => '#{pr.attributes['Description']}'"
        puts "  user_or_group_sid => #{pr.attributes['UserOrGroupSid']}"
        puts "  action            => #{pr.attributes['Action']}"
        puts '}'
        puts
      end
    end
  end

  def create
    # Get-ChildItem C:\Windows\System32\*.exe | Get-AppLockerFileInformation | New-AppLockerPolicy -RuleType Publisher, Hash -User Everyone -RuleNamePrefix System32
    # an array to store powershell command
  #array = []
    # raise an error if no rule_type specified...
  #if @resource[:prefix].to_s.strip.empty?
    #raise Puppet::Error, 'AppLockerPolicy must be supplied a rule_type = [file, hash, publisher]'
  #end
    # add cmd and options...
  #array << "New-AppLockerPolicy '#{resource[:name]}'"
    # array << "Import-Module ServerManager; Install-WindowsFeature #{resource[:name]}"
  #array << "-RuleType #{resource[:rule_type]}"
  #array << "-User #{resource[:user]}" unless @resource[:user].to_s.strip.empty?
  #array << "-RuleNamePrefix #{resource[:prefix]}" unless @resource[:prefix].to_s.strip.empty?
    # show the created ps string, get the result, show the result (debug)
  #Puppet.debug "Powershell create command is '#{array}'"
    # dont enable creation yet...
    # result = ps(array.join(' '))
    # Puppet.debug "Powershell create response was '#{result}'"
  end

  def exists?
    # lookup resource in applocker
  end

  def destroy; end

  # def self.prefetch(resources) end
end
