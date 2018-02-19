Puppet::Type.newtype(:windowspolicy) do
  @doc = 'Test type.'

  ensurable

  newparam(:name) do
    desc 'Test policy name.'
  end
end
