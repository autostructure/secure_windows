#
# This fact returns AD accounts that haven't been logged into in 35 days and are enabled
#
Facter.add('unused_accounts') do
  confine operatingsystem: :windows
  setcode do
    command = ''
    powershell = 'C:\Windows\system32\WindowsPowerShell\v1.0\powershell.exe'
    if Facter.value(:windows_server_type) == 'windowsdc'
      command = 'Search-ADAccount -AccountInactive -UsersOnly -TimeSpan 35 | Where-Object { $_.Enabled -eq $true } | FT SamAccountName -HideTableHeaders'
    else
      command = "([ADSI]('WinNT://{0}' -f $env:COMPUTERNAME)).Children | Where { $_.SchemaClassName -eq 'user' } | ForEach { if (((([ADSI]$_.Path).Properties.UserFlags.Value -band 0x2) -ne 0x2) -eq 'True') { if ((([ADSI]$_.Path).Properties.LastLogin.Value) -lt (Get-Date).AddDays(-35)) {Write-Host ([ADSI]$_.Path).Name} } }"
    end
    Facter::Core::Execution.exec("#{powershell} -command \"#{command}\"")
  end
end
