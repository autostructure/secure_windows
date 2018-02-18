require 'puppet'
require 'rexml/document'
include REXML
Puppet::Type.type(:windowspolicy).provide(:policyprovider) do
  @doc = 'Test provider.'

  confine :kernel => :windows
  commands :ps => File.exist?("#{ENV['SYSTEMROOT']}\\system32\\windowspowershell\\v1.0\\powershell.exe") ? "#{ENV['SYSTEMROOT']}\\system32\\windowspowershell\\v1.0\\powershell.exe" : 'powershell.exe'
  # commands :ps => 'c:\windows\system32\windowspowershell\v1.0\powershell.exe'
  def self.instances
    puts 'instances'
    # xmlstr = ps("Get-AppLockerPolicy -Domain -XML -Ldap \'LDAP://WIN-HEMGTARNJON.AUTOSTRUCTURE.IO/CN={78E10B45-DBC6-4880-9123-D78BF6F72C0E},CN=Policies,CN=System,DC=autostructure,DC=io\'")
    # xmlstr = File.read './examples/applocker.xml'
    # xmlstr = File.read 'C:/Windows/Temp/applocker.xml'
    # applocker_policies = []
    xml_string = ps('Get-AppLockerPolicy -Effective -Xml')
    xml_doc = Document.new xml_string
    Puppet.debug 'powershell.rb::self.instances::xml_string='
    Puppet.debug xml_string
    xml_doc.root.each_element('RuleCollection') do |rc|
      # REXML Attributes are returned with the attribute and its value, including delimiters.
      # e.g. <RuleCollection Type='Exe' ...> returns "Type='Exe'".
      # So, the value must be parsed using slice.
      #rule_collection_type = rc.attribute('Type').to_string.slice(/=['|"]*(.*)['|"]/,1)
      #rule_collection_enforcementmode = rc.attribute('EnforcementMode').to_string.slice(/=['|"]*(.*)['|"]/,1)
      # must loop through each type of rule tag, I couldn't find how to grab tag name from REXML :/
      rc.each_element('FilePathRule') do |fpr|
        rule = {}
        rule[:ensure]            = :present
        rule[:name]              = fpr.attribute('Name').to_string.slice(/=['|"]*(.*)['|"]/,1)
        rule[:description]       = fpr.attribute('Description').to_string.slice(/=['|"]*(.*)['|"]/,1)
        self.new(rule)
      end
    end
  end

  def create
    puts 'create'
  end

  def destroy
    puts 'destroy'
  end

  def exists?
    puts 'exists?'
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
    puts 'prefetch'
    instances.each do |prov|
      if @resource = resources[prov.name]
        @resource.provider = prov
      end
    end
  end

  def flush
    puts 'flush'
  end
end
