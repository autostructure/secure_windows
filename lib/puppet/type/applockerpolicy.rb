Puppet::Type.newtype(:applockerpolicy) do
  @doc = 'Manage the Windows O/S AppLocker policies.'

  ensurable do
    defaultvalues
    defaultto :present
  end

  newparam(:name) do
    isnamevar
  end

  newparam(:rule_type) do
    desc 'The type of AppLocker rule [file, hash, publisher].'
    newvalues('file', 'hash', 'publisher')
  end

  newparam(:collection_type) do
    desc 'The type of AppLocker collection [Appx, Dll, Exe, Msi, Script].'
    newvalues('Appx', 'Dll', 'Exe', 'Msi', 'Script')
  end

  newproperty(:enforcement_mode) do
    desc 'Is the rule enforced? [Enabled, Disabled, NotConfigured]'
    newvalues('Enabled', 'Disabled', 'NotConfigured')
  end

  newparam(:id) do
    desc 'The AppLocker rule identifier.'
  end

  newparam(:description) do
    desc 'The AppLocker rule description.'
  end

  newparam(:user_or_group_sid) do
    desc 'The AppLocker user or group system identifier.'
  end

  newparam(:action) do
    desc 'The AppLocker action [Allow, Deny].'
    newvalues('Allow', 'Deny')
  end

  newparam(:user) do
    desc 'The o/s user that will set the AppLocker policy rule.'
  end

  newparam(:prefix) do
    desc 'A prefix to prepend to the AppLocker rule.'
  end
end
