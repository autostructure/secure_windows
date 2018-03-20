# Test Provider.
# WindowsPolicy {'c:\windows\temp\windowspolicy.txt':
#   ensure => present,
#   name   => 'c:\windows\temp\windowspolicy.txt',
# }
Puppet::Type.type(:windowspolicy).provide(:policyprovider) do
  desc 'Test provider description.'
  # @doc = 'Test provider.'

  confine :kernel => :windows

  def create
    File.open(@resource[:name], 'w') { |f| f.puts '' } # Create an empty file
  end

  def destroy
    File.unlink(@resource[:name])
  end

  # true -> will NOT call the create method, false -> calls create
  def exists?
    File.exist?(@resource[:name])
  end

  def self.instances
    provider_array = []
    test_property_hash = {}
    test_property_hash[:name]   = 'c:\windows\temp\windowspolicy.txt'
    test_property_hash[:ensure] = :present
    provider_array.push(new(test_property_hash))
    provider_array
  end

  # def self.instances
  #  puts 'windowspolicy::policyprovider::instances'
  # end
  #    xml_string = ps('Get-AppLockerPolicy -Effective -Xml')
  #    xml_doc = Document.new xml_string
  #    Puppet.debug 'powershell.rb::self.instances::xml_string='
  #    Puppet.debug xml_string
  #    xml_doc.root.each_element('RuleCollection') do |rc|
  #      rc.each_element('FilePathRule') do |fpr|
  # rule = {}
  #        rule[:ensure]            = :present
  #        rule[:name]              = fpr.attribute('Name').to_string.slice(/=['|"]*(.*)['|"]/,1)
  #        rule[:description]       = fpr.attribute('Description').to_string.slice(/=['|"]*(.*)['|"]/,1)
  # rule = {:ensure => :present, :name => 'windowspolicytest'}
  # puts 'windowspolicy::policyprovider::instances0'
  # self.new(rule)
  # rule
  # puts 'windowspolicy::policyprovider::instances1'
  #      end
  #    end

  # This method may be implemented by a provider in order to pre-fetch resource properties.
  # If implemented it should set the provider instance of the managed resources to a provider with the fetched state
  # (i.e. what is returned from the instances method).

  #  # caused an error...
  #  # Error: Failed to apply catalog: undefined method `each' for nil:NilClass
  #  def self.prefetch(resources)
  #   puts 'powershell.rb::prefetch called.'
  #    instances.each do |prov|
  #      if @resource = resources[prov.name]
  #        @resource.provider = prov
  #      end
  #    end
  #  end
end