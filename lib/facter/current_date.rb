# Echos the current date. Super complex.

Facter.add('current_date') do
  confine operatingsystem: :windows
  setcode do
    powershell = 'C:\Windows\system32\WindowsPowerShell\v1.0\powershell.exe'
    command = 'Get-Date -Format g'
    Facter::Core::Execution.exec(%(#{powershell} -command "#{command}"))
    currdate.match(/........./)
  end
end
