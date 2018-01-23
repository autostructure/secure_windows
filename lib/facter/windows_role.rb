require 'facter'

Facter.add(:windows_role) do
    confine :operatingsystem => :windows
    setcode do
  
      require 'facter/util/wmi'
      roles = []
  
      wmi = Facter::Util::WMI.connect()
      wmi.ExecQuery("select ID from Win32_ServerFeature").each do |role|
        roles.push(role.HotFixID)
      end
  
      roles.sort.join(',')
    end
  end