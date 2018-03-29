#
# This fact returns the machine with the PDC Emulator Role
#
Facter.add('pdc_emulator_role') do
  confine operatingsystem: :windows
  setcode do
    powershell = 'C:\Windows\system32\WindowsPowerShell\v1.0\powershell.exe'
    command = '(get-addomain).pdcemulator'
    Facter::Core::Execution.exec(%(#{powershell} -command "#{command}"))
  end
end
