require 'facter'

Facter.add(:windows_type) do
  confine operatingsystem: :windows
  setcode do
    roles = []

    require 'win32ole'
    wmi = WIN32OLE.connect('winmgmts:\\\\.\\root\\cimv2')
    wmi.ExecQuery('select * from Win32_ComputerSystem').each do |role|
      roles.push(role.DomainRole)
    end

    roles.sort.join(',')
    roles.to_s
  end
end
