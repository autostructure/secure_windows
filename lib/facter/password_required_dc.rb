#
# This fact returns AD accounts that do not require a password
#
Facter.add('password_required_dc') do
  confine operatingsystem: :windows
  setcode do
    powershell = 'C:\Windows\system32\WindowsPowerShell\v1.0\powershell.exe'
    command = 'Get-Aduser -Filter * -Properties Passwordnotrequired | Where-Object { $_.Enabled -eq $true } | Where-Object { $_.Passwordnotrequired -eq $true } | FT Name, Passwordnotrequired, Enabled'
    Facter::Core::Execution.exec(%(#{powershell} -command "#{command}"))
  end
end
