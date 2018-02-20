Puppet::Type.newtype(:applockerpolicy) do
  @doc = 'Manage the Windows O/S AppLocker policies.'

  ensurable

  newparam(:name) do
    desc 'applockerpolicy.rb::name (namevar).'
    isnamevar
  end

  newparam(:description) do
    desc 'The AppLocker rule description.'
  end

  newparam(:rule_type) do
    desc 'The type of AppLocker rule [file, hash, publisher].'
    #newvalues(:file, :hash, :publisher)
  end

  newparam(:type) do
    desc 'The type of AppLocker collection [Appx, Dll, Exe, Msi, Script].'
    #newvalues(:Appx, :Dll, :Exe, :Msi, :Script)
  end

  newparam(:enforcementmode) do
    desc 'Is the rule enforced? [Enabled, Disabled, NotConfigured]'
    #newvalues(:Enabled, :Disabled, :NotConfigured)
  end

  newparam(:action) do
    desc 'The AppLocker action [Allow, Deny].'
    #newvalues(:Allow, :Deny)
  end

  newparam(:id) do
    desc 'The AppLocker rule identifier.'
  end

  newparam(:user_or_group_sid) do
    desc 'The AppLocker user or group system identifier.'
  end

  #newparam(:user) do
  #  puts 'applockerpolicy.rb::user'
    # desc 'The o/s user that will set the AppLocker policy rule.'
  #end

  #newparam(:prefix) do
  #  puts 'applockerpolicy.rb::prefix'
    # desc 'A prefix to prepend to the AppLocker rule.'
  #end
end
