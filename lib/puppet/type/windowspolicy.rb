Puppet::Type.newtype(:windowspolicy) do
  @doc = 'Test type.'

  ensurable

  newparam(:name, :namevar => true) do
    puts 'windowspolicy.rb::name'
    # isnamevar
  end

  newparam(:description) do
    puts 'windowspolicy.rb::description'
  end
end
