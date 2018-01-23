require 'facter'

Facter.add(:windows_role) do
    confine :operatingsystem => :windows
    setcode do
  
      require 'facter/util/wmi'
      roles = []
  
      require 'win32ole'
      wmi = WIN32OLE.connect("winmgmts:\\\\.\\root\\cimv2")
      wmi.ExecQuery("select ID from Win32_ServerFeature").each do |role|
        roles.push(role.HotFixID)
      end
  
      roles.sort.join(',')
    end
  end