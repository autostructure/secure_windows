require 'rexml/document'
include REXML
Puppet::Type.type(:applockerpolicy).provide(:powershell) do
  desc 'Use the Windows O/S powershell.exe tool to manage AppLocker policies.'
  # For the AppLockerPolicy to be enforced on a computer, the Application Identity service must be running.

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

  def clear
    Puppet.debug 'powershell.rb::clear'
    xml_clear_all_rules = '<AppLockerPolicy Version="1">'
    xml_clear_all_rules << '<RuleCollection Type="Appx" EnforcementMode="NotConfigured" />'
    xml_clear_all_rules << '<RuleCollection Type="Exe" EnforcementMode="NotConfigured" />'
    xml_clear_all_rules << '<RuleCollection Type="Msi" EnforcementMode="NotConfigured" />'
    xml_clear_all_rules << '<RuleCollection Type="Script" EnforcementMode="NotConfigured" />'
    xml_clear_all_rules << '<RuleCollection Type="Dll" EnforcementMode="NotConfigured" />'
    xml_clear_all_rules << '</AppLockerPolicy>'
    clearfile = File.open(tempfile, 'w')
    clearfile.puts xml_clear_all_rules
    clearfile.close
    ps("Set-AppLockerPolicy -XMLPolicy #{tempfile}")
    File.unlink(tempfile)
  end

  def filepathrule2xml
    ret_xml = "<FilePathRule Id=\"#{@resource[:id]}\" Name=\"#{@resource[:name]}\" "
    ret_xml << "Description=\"#{@resource[:description]}\" UserOrGroupSid=\"#{@resource[:user_or_group_sid]}\" Action=\"#{@resource[:action]}\">"
    any_conditions = !@resource[:conditions].empty?
    any_exceptions = !@resource[:exceptions].empty?
    ret_xml << '<Conditions>' if any_conditions
    ret_xml << "<FilePathCondition Path=\"#{@resource[:conditions]}\" />" if any_conditions
    # @resource[:conditions].each { |path| ret_xml.concat("<FilePathCondition Path=\"#{path}\" />") }
    # @resource[:conditions].each { |path| ret_xml << "<FilePathCondition Path=\"#{path}\" />" }
    ret_xml << '</Conditions>' if any_conditions
    ret_xml << '<Exceptions>' if any_exceptions
    ret_xml << "<FilePathException Path=\"#{@resource[:exceptions]}\" />" if any_exceptions
    # @resource[:exceptions].each { |path| ret_xml.concat("<FilePathException Path=\"#{path}\" />") }
    # @resource[:exceptions].each { |path| ret_xml << "<FilePathException Path=\"#{path}\" />" }
    ret_xml << '</Exceptions>' if any_exceptions
    ret_xml << '</FilePathRule>'
    ret_xml
  end

  def conditions2array node
    ['c:\Windows\Temp\*', 'c:\Users\Public']
  end

  def exceptions2array node
    ['c:\Windows', 'c:\Users']
  end

  def convert_filepaths2xml
    # TODO: this method is untested.
    ret_xml = ''
    Puppet.debug "convert_filepaths2xml: @resource[:conditions] = #{@resource[:conditions]}"
    Puppet.debug "convert_filepaths2xml: @resource[:exceptions] = #{@resource[:exceptions]}"
    c = @resource[:conditions]
    e = @resource[:exceptions]
    any_conditions = !c.empty?
    any_exceptions = !e.empty?
    # FilePathConditions...
    Puppet.debug 'convert_filepaths2xml: conditions started - c.class='
    Puppet.debug c.class
    Puppet.debug 'c.inspect...'
    Puppet.debug c.inspect
    ret_xml << '<Conditions>' if any_conditions
    case [c]
    when [Array]
      c.each { |path| ret_xml << "<FilePathCondition Path=\"#{path}\" />" }
    when [String]
      Puppet.debug 'hi'
      ret_xml << "<FilePathCondition Path=\"#{@resource[:conditions]}\" />"
      Puppet.debug 'bye'
    else
      Puppet.debug "AppLockerPolicy property, 'conditions' <#{@resource[:conditions].class}>, is not a String or Array.  See resource with rule id = #{@resource[:id]}"
    end
    ret_xml << '</Conditions>' if any_conditions
    Puppet.debug 'convert_filepaths2xml: conditions done.'
    # FilePathExceptions...
    ret_xml << '<Exceptions>' if any_exceptions
    case [e]
    when [Array]
      e.each { |path| ret_xml << "<FilePathException Path=\"#{path}\" />" }
    when [String]
      ret_xml << "<FilePathException Path=\"#{@resource[:exceptions]}\" />"
    else
      Puppet.debug "AppLockerPolicy property, 'exceptions' <#{@resource[:exceptions].class}>, is not a String or Array.  See resource with rule id = #{@resource[:id]}"
    end
    ret_xml << '</Exceptions>' if any_exceptions
    Puppet.debug 'convert_filepaths2xml: xml='
    Puppet.debug ret_xml
    ret_xml
  end

  def create
    Puppet.debug 'powershell.rb::create called.'
    xml_create = "<AppLockerPolicy Version='1'><RuleCollection Type='#{@resource[:type]}' EnforcementMode='#{@resource[:enforcementmode]}'>"
    xml_create << "<FilePathRule Id='#{@resource[:id]}' Name='#{@resource[:name]}' Description='#{@resource[:description]}' UserOrGroupSid='#{@resource[:user_or_group_sid]}' Action='#{@resource[:action]}'>"
    xml_create << convert_filepaths2xml
    xml_create << "</FilePathRule></RuleCollection></AppLockerPolicy>"
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
    # read all xml
    xml_all_policies = ps('Get-AppLockerPolicy -Effective -Xml')
    xml_doc_should = Document.new xml_all_policies
    x = "//FilePathRule[@Id='#{@property_hash[:id]}']"
    a = xml_doc_should.root.get_elements x
    if a.first != nil
      xml_doc_should.root.delete_elements a.first
    end
  end

  def exists?
    Puppet.debug 'powershell.rb::exists?'
    @property_hash[:ensure] = :present
  end

  def self.instances
    Puppet.debug 'powershell.rb::instances called.'
    provider_array = []
    xml_string = ps('Get-AppLockerPolicy -Effective -Xml')
    xml_doc = Document.new xml_string
    Puppet.debug 'powershell.rb::self.instances::xml_string.strip:'
    Puppet.debug xml_string.strip
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
          conditions:        conditions2array(fpr),
          exceptions:        exceptions2array(fpr),
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
    # the resources object contains all resources in the catalog.
    # the instances method below returns an array of provider objects.
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
    # set calls create method if necessary (if rule's Id not found).
    set
    # update @property_hash
    # set @property_hash = @property_hash[]
  end

  def update_filepaths(node)
    Puppet.debug "update_filepaths: @resource[:conditions] = #{@resource[:conditions]}"
    Puppet.debug "update_filepaths: @resource[:exceptions] = #{@resource[:exceptions]}"
    Puppet.debug "update_filepaths: @property_hash[:conditions] = #{@property_hash[:conditions]}"
    Puppet.debug "update_filepaths: @property_hash[:exceptions] = #{@property_hash[:exceptions]}"
    Puppet.debug 'update_filepaths: a,b (property_hash)='
    a = @property_hash[:conditions]
    b = @property_hash[:exceptions]
    Puppet.debug a.class
    Puppet.debug b.class
    Puppet.debug 'update_filepaths: m,n (property_flush)='
    m = @property_flush[:conditions]
    n = @property_flush[:exceptions]
    Puppet.debug m.class
    Puppet.debug n.class
    Puppet.debug 'update_filepaths: c,e (resource)='
    c = @resource[:conditions]
    e = @resource[:exceptions]
    Puppet.debug c.class
    Puppet.debug e.class
    any_conditions = !c.empty?
    any_exceptions = !e.empty?
    Puppet.debug 'update_filepaths: any_conditions/exceptions...'
    Puppet.debug any_conditions
    Puppet.debug any_exceptions
    Puppet.debug 'update_filepaths: b4 delete_all...'
    Puppet.debug node
    # delete all FilePathRule's children, which are FilePathCondition and FilePathException elements.
    node.elements.delete_all './*'
    Puppet.debug 'update_filepaths: after delete_all...'
    Puppet.debug 'update_filepaths: node.class & node...'
    Puppet.debug node.class
    Puppet.debug node
    # FilePathConditions...
    Puppet.debug 'update_filepaths: FilePathConditions...'
    node_conditions = Element.new 'Conditions'
    node.add_element node_conditions if any_conditions
    Puppet.debug 'update_filepaths: case...'
    Puppet.debug 'update_filepaths: c.class...'
    Puppet.debug c.class
    node_filepath = Element.new 'FilePathCondition'
    node_filepath.add_attribute 'Path', @resource[:conditions]
    node_conditions.add_element node_filepath
    #case c.class
    #when Array
    #  puts 'Array in case'  # c.each { |path| node.add_element 'FilePathCondition', 'Path' => path.to_s }
    #when String
    #  puts 'String in case'  # node.add_element 'FilePathCondition', 'Path' => @resource[:conditions].to_s
    #else
    #  Puppet.Debug "AppLockerPolicy property, 'conditions' <#{@resource[:conditions].class}>, is not a String or Array.  See resource with rule id = #{@resource[:id]}"
    #end
    # FilePathExceptions...
    Puppet.debug 'update_filepaths: completed node: node ='
    Puppet.debug node
    node
  end

  def set
    Puppet.debug 'powershell.rb::set'
    Puppet.debug 'convert_filepaths2xml...'
    s = convert_filepaths2xml
    Puppet.debug 'xml= '
    Puppet.debug s
    # read all xml
    xml_all_policies = ps('Get-AppLockerPolicy -Effective -Xml')
    Puppet.debug 'powershell.rb::set powershell Get-AppLockerPolicy returns (with String.strip applied)...'
    Puppet.debug xml_all_policies.strip
    xml_doc_should = Document.new xml_all_policies
    begin
      begin
        x = "//FilePathRule[@Id='#{@property_hash[:id]}']"
        a = xml_doc_should.root.get_elements x
        Puppet.debug 'set after get_elements...'
        Puppet.debug a
        Puppet.debug a.class
        # set attributes if xpath found the element, create element if not found.
        if a.first.nil?
          create
        else
          # an Array of Elements is returned, so to set Element attributes we must get it from Array first.
          e = a.first
          e.attributes['Name'] = @property_hash[:name]
          e.attributes['Description'] = @property_hash[:description]
          e.attributes['Id'] = @property_hash[:id]
          e.attributes['UserOrGroupSid'] = @property_hash[:user_or_group_sid]
          e.attributes['Action'] = @property_hash[:action]
          # ensure, rule_type, rule_collection_type, rule_collection_enforcementmode,
          # conditions, exceptions
          # use e.first.child to access conditions (or exceptions...probably array of children accessed as elements?)
          # or prune all children and rebuild (via add_element) the FilePathCondition/FilePathException tree.
          Puppet.debug 'e...'
          Puppet.debug e
          update_filepaths e
          Puppet.debug 'e after filepaths update...'
          Puppet.debug e
          # apply change...
          Puppet.debug 'powershell.rb::set xml_doc_should.root() after update_filepaths b4 powershell...'
          Puppet.debug xml_doc_should.root
          Puppet.debug "powershell.rb::set creating temp file => #{tempfile}"
          xmlfile = File.open(tempfile, 'w')
          xmlfile.puts xml_doc_should
          xmlfile.close
          # Set-AppLockerPolicy (no merge)
          # NOTE: The Set-AppLockerPolicy powershell command would not work with the '-Merge' option.
          #       Since I have to leave off -Merge to update, I have to set all the policies.
          #       The -Merge option discards any attribute changes to existing rules.
          ps("Set-AppLockerPolicy -XMLPolicy #{tempfile}")
          File.unlink(tempfile)
          Puppet.debug "deleted #{tempfile}"
        end
      rescue err
        Puppet.debug "powershell.rb::set problem setting element attributes (or creating rule): Error=#{err}"
      end
      # empty applocker query returns this string (after removing whitespaces)...
    end unless xml_all_policies.strip == '<AppLockerPolicy Version="1" />'
  end
end
