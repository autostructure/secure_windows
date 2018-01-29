Puppet::Type.newtype(:group_policy_template) do
  desc 'Puppet type that supports Windows group policy templates.'

  ensurable

  newparam(:name) do
    desc "Group policy security template name"
  end

  newparam(:sdbfilepath) do
    desc "Path to the security database file"
  end

  newparam(:templatefilepath) do
    desc "Path to the group policy template file (*.admx)"

    validate do |value|
      raise ArgumentError, "Key must be included ':'" if value.nil?
    end
  end

  #newparam(:type) do
  #  desc 'The datatype of the key'
  #  newvalues(:string, :int, :integer, :float, :bool, :boolean)
  #end

  #newproperty(:value) do
  #  desc 'The value to assign to the key'
  #end

  def pre_run_check
  #  if self[:value].nil?
  #    raise Puppet::Error, "A value is required!"
  #  end
  end
end
