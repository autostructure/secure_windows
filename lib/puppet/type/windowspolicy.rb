Puppet::Type.newtype(:windowspolicy) do
  @doc = 'Test type.'

  ensurable

  newparam(:name, :namevar => true) do
    puts 'windowspolicy.rb::name'
    # isnamevar
  end
end
