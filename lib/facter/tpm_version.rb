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
    version = wmi.ExecQuery('select SpecVersion from Win32_Tpm')
    if version == ''
      version = 'TPM not enabled'
    else
      version
    end
  end
end
