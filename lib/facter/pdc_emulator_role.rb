#
# This fact returns the machine with the PDC Emulator Role
#
Facter.add('pdc_emulator_role') do
  confine operatingsystem: :windows
  setcode do
    powershell = 'C:\Windows\system32\WindowsPowerShell\v1.0\powershell.exe'
    command = '(Get-ADDomain).PDCEmulator'
    Facter::Core::Execution.exec(%(#{powershell} -command "#{command}"))
  end
end
