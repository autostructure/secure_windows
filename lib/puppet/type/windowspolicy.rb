Puppet::Type.newtype(:windowspolicy) do
  @doc = 'Test type.'

  ensurable do
    puts 'windowspolicy.rb::ensurable'
    defaultvalues
    defaultto :present
  end

  newparam(:name) do
    puts 'windowspolicy.rb::name'
    isnamevar
  end

  newparam(:description) do
    puts 'windowspolicy.rb::description'
  end
end
