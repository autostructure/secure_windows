#
# This fact returns the TPM version of the system
#
# NOTICE: THIS IS NOT DONE
#
require 'facter'

Facter.add(:tpm_version) do
  confine operatingsystem: :windows
  setcode do
    powershell = 'C:\Windows\system32\WindowsPowerShell\v1.0\powershell.exe'
    command = 'Get-tpm'
    Facter::Core::Execution.exec(%(#{powershell} -command "#{command}"))
  end
end
