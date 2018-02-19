Puppet::Type.newtype(:windowspolicy) do
  @doc = 'Test type.'

  ensurable

  newparam(:name) do
    desc "Test policy name."
  end

  #  newparam(:name) do
  #    isnamevar
  #    puts 'windowspolicy.rb::name'
  #  end
  #newparam(:name, :namevar => true) do
  #  desc 'windowspolicy.rb::name (param)'
  #  puts 'windowspolicy.rb::name'
  #  munge do |value|
  #    value.downcase
  #  end
  #  def insync?(is)
  #    is.downcase == should.downcase
  #  end
  #end
end
