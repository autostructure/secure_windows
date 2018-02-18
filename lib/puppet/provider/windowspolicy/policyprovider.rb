Puppet::Type.type(:windowspolicy).provide(:policyprovider) do
  @doc = 'Test provider.'

  confine :kernel => :windows
  #commands :ps => File.exist?("#{ENV['SYSTEMROOT']}\\system32\\windowspowershell\\v1.0\\powershell.exe") ? "#{ENV['SYSTEMROOT']}\\system32\\windowspowershell\\v1.0\\powershell.exe" : 'powershell.exe'

  def self.instances
    puts 'instances'
#    xml_string = ps('Get-AppLockerPolicy -Effective -Xml')
#    xml_doc = Document.new xml_string
#    Puppet.debug 'powershell.rb::self.instances::xml_string='
#    Puppet.debug xml_string
#    xml_doc.root.each_element('RuleCollection') do |rc|
#      rc.each_element('FilePathRule') do |fpr|
        #rule = {}
#        rule[:ensure]            = :present
#        rule[:name]              = fpr.attribute('Name').to_string.slice(/=['|"]*(.*)['|"]/,1)
#        rule[:description]       = fpr.attribute('Description').to_string.slice(/=['|"]*(.*)['|"]/,1)
        #rule = {:ensure => :present, :name => 'windowspolicytest'}
        puts 'instances0'
        #self.new(rule)
        #rule
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
    #true <- worked
    false
  end
end
