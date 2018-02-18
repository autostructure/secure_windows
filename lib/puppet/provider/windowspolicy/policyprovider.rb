Puppet::Type.type(:windowspolicy).provide(:policyprovider) do
  @doc = 'Test provider.'

  confine :kernel => :windows
  commands :ps => File.exist?("#{ENV['SYSTEMROOT']}\\system32\\windowspowershell\\v1.0\\powershell.exe") ? "#{ENV['SYSTEMROOT']}\\system32\\windowspowershell\\v1.0\\powershell.exe" : 'powershell.exe'

  def self.instances
    puts 'instances'
#    xml_string = ps('Get-AppLockerPolicy -Effective -Xml')
#    xml_doc = Document.new xml_string
#    Puppet.debug 'powershell.rb::self.instances::xml_string='
#    Puppet.debug xml_string
#    xml_doc.root.each_element('RuleCollection') do |rc|
#      rc.each_element('FilePathRule') do |fpr|
        rule = {}
#        rule[:ensure]            = :present
#        rule[:name]              = fpr.attribute('Name').to_string.slice(/=['|"]*(.*)['|"]/,1)
#        rule[:description]       = fpr.attribute('Description').to_string.slice(/=['|"]*(.*)['|"]/,1)
        rule = {:ensure => :present, :name => 'windowspolicytest'}
        puts 'instances0'
        self.new(rule)
        puts 'instances1'
#      end
#    end
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
