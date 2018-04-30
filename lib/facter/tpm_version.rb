#
# This fact returns the TPM version of the system
#
# NOTICE: THIS IS NOT DONE
#
require 'facter'

Facter.add(:tpm_version) do
  confine operatingsystem: :windows
  setcode do
    require 'win32ole'
    wmi = WIN32OLE.connect('winmgmts:\\\\.\\root\\cimv2')
    v = ''
    wmi.ExecQuery('select SpecVersion from Win32_Tpm').each do |version|
      v = version.SpecVersion
    end
    v
  end
end
