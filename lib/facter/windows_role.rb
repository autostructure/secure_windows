#
# This fact returns a comma separated list of role IDs on the machine
#
# Check this out for translations from ID to role: https://msdn.microsoft.com/en-us/library/cc280268(VS.85).aspx#properties
#
require 'facter'

Facter.add(:windows_role) do
  confine operatingsystem: :windows
  setcode do
    roles = []

    require 'win32ole'
    wmi = WIN32OLE.connect("winmgmts:\\\\.\\root\\cimv2")
    wmi.ExecQuery("select ID from Win32_ServerFeature").each do |role|
      roles.push(role.ID)
    end

    roles.sort.join(',')
  end
end
