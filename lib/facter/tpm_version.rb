#
# This fact returns the TPM version of the system
#
require 'facter'

Facter.add(:windows_role) do
  confine operatingsystem: :windows
  setcode do
    roles = []

    require 'win32ole'
    wmi = WIN32OLE.connect('Win32_Tpm:\\\\.\\root\\cimv2\\Security\\MicrosoftTpm')
    wmi.ExecQuery('select SpecVersion from Win32_Tpm').each do |role|
      roles.push(role.SpecVersion)
    end

    roles.sort.join(',')
  end
end
