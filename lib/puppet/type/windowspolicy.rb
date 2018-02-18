Puppet::Type.newtype(:windowspolicy) do
  @doc = 'Test type.'

  ensurable

  newparam(:name) do
    isnamevar
    puts 'windowspolicy.rb::name'
  end
end
