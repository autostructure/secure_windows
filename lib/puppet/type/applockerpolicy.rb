Puppet::Type.newtype(:applockerpolicy) do
  @doc = 'Manage the Windows O/S AppLocker policies.  For more information see: https://docs.microsoft.com/en-us/windows/security/threat-protection/applocker/applocker-overview'

  ensurable

  newparam(:name) do
    desc 'applockerpolicy.rb::name (namevar).'
    isnamevar
  end

  newproperty(:description) do
    desc 'The AppLocker rule description.'
  end

  newproperty(:rule_type) do
    desc 'The type of AppLocker rule [file, hash, publisher].'
    defaultto :file
    newvalues(:file, :hash, :publisher)
  end

  newproperty(:type) do
    desc 'The type of AppLocker collection [Appx, Dll, Exe, Msi, Script].'
    newvalues(:Appx, :Dll, :Exe, :Msi, :Script)
  end

  newproperty(:enforcementmode) do
    desc 'Is the rule enforced? [Enabled, Disabled, NotConfigured]'
    newvalues(:Enabled, :Disabled, :NotConfigured)
  end

  newproperty(:action) do
    desc 'The AppLocker action [Allow, Deny].'
    newvalues(:Allow, :Deny)
  end

  newproperty(:id) do
    desc 'The AppLocker rule identifier.'
  end

  newproperty(:user_or_group_sid) do
    desc 'The AppLocker user or group system identifier.  See https://support.microsoft.com/en-us/help/243330/well-known-security-identifiers-in-windows-operating-systems'
  end

  newproperty(:conditions) do
    desc 'The AppLocker rule conditions.  Only one condition is allowed <String>.'
  end

  newproperty(:exceptions, array_matching: :all) do
    desc 'The AppLocker rule exceptions, an array of file paths listing files not affected by the rule.'
  end
end
