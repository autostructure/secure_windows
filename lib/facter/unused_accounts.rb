#
# This fact returns AD accounts that haven't been logged into in 35 days and are enabled
#
Facter.add('unused_accounts') do
  confine operatingsystem: :windows
  setcode do
    powershell = 'C:\Windows\system32\WindowsPowerShell\v1.0\powershell.exe'
    command = 'Search-ADAccount -AccountInactive -UsersOnly -TimeSpan 35.00::00::00 | Where-Object { $_.Enabled -eq $true } | FT SamAccountName -HideTableHeaders'
    Facter::Core::Execution.exec(%(#{powershell} -command "#{command}"))
  end
end
