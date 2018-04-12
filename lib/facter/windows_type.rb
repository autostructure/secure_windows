#
# This fact returns a number for the type of server
#
# 0: Standalone Workstation
# 1: Member Workstation
# 2: Standalone Server
# 3: Member Server
# 4: Backup Domain Controller
# 5: Primary Domain Controller
#
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
