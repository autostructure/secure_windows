Puppet::Type.newtype(:applockerpolicy) do
  @doc = 'Manage the Windows O/S AppLocker policies.'

  ensurable do
    defaultvalues
    defaultto :present
    puts 'applockerpolicy.rb::ensurable'
  end

  newparam(:name) do
    puts 'applockerpolicy.rb::name'
    isnamevar
  end

  newparam(:rule_type) do
    puts 'applockerpolicy.rb::rule_type'
    # desc 'The type of AppLocker rule [file, hash, publisher].'
    newvalues(:file, :hash, :publisher)
  end

  newparam(:type) do
    puts 'applockerpolicy.rb::type'
    # desc 'The type of AppLocker collection [Appx, Dll, Exe, Msi, Script].'
    newvalues(:Appx, :Dll, :Exe, :Msi, :Script)
  end

  newproperty(:enforcementmode) do
    puts 'applockerpolicy.rb::enforcementmode'
    # desc 'Is the rule enforced? [Enabled, Disabled, NotConfigured]'
    newvalues(:Enabled, :Disabled, :NotConfigured)
  end

  newparam(:id) do
    puts 'applockerpolicy.rb::id'
    # desc 'The AppLocker rule identifier.'
  end

  newparam(:description) do
    puts 'applockerpolicy.rb::description'
    # desc 'The AppLocker rule description.'
  end

  newparam(:user_or_group_sid) do
    puts 'applockerpolicy.rb::user_or_group_sid'
    # desc 'The AppLocker user or group system identifier.'
  end

  newparam(:action) do
    puts 'applockerpolicy.rb::action'
    # desc 'The AppLocker action [Allow, Deny].'
    newvalues(:Allow, :Deny)
  end

  newparam(:user) do
    puts 'applockerpolicy.rb::user'
    # desc 'The o/s user that will set the AppLocker policy rule.'
  end

  newparam(:prefix) do
    puts 'applockerpolicy.rb::prefix'
    # desc 'A prefix to prepend to the AppLocker rule.'
  end
end
