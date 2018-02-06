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
    # validate value
    validate do |value|
      if value.is_empty? # TODO: and check for 1 of the 3 values.
        raise Puppet::Error, 'AppLockerPolicy requires a rule type [file, hash, publisher].'
      end
    end
  end

  newparam(:collection_type) do
    desc 'The type of AppLocker collection [Appx, Dll, Exe, Msi, Script].'
  end

  newparam(:enforcement_mode) do
    desc 'Is the rule enforced?'
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
    desc 'The AppLocker action.'
  end
end
