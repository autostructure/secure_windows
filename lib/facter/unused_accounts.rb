#
# This fact returns AD accounts that haven't been logged into in 35 days and are enabled
#
Facter.add('unused_accounts') do
  confine operatingsystem: :windows
  setcode do
    powershell = 'C:\Windows\system32\WindowsPowerShell\v1.0\powershell.exe'
    #command = 'Search-ADAccount -AccountInactive -UsersOnly -TimeSpan 35.00::00::00 | Where-Object { $_.Enabled -eq $true } | FT SamAccountName -HideTableHeaders'
    command = <<-HEREDOC
    ([ADSI]('WinNT://{0}' -f $env:COMPUTERNAME)).Children | Where { $_.SchemaClassName -eq 'user' } | ForEach {
    $user = ([ADSI]$_.Path)
    $lastLogin = $user.Properties.LastLogin.Value
    $enabled = ($user.Properties.UserFlags.Value -band 0x2) -ne 0x2
    $laterdate = (Get-Date).AddDays(35)
    if ($lastLogin -eq $null) {
    $lastLogin = 'Never'
    }
    if ($enabled -eq 'True') {
    if ($lastLogin -gt $laterdate) {
    Write-Host $user.Name
    }
    } 
    }
    HEREDOC
    Facter::Core::Execution.exec(%(#{powershell} -command "#{command}"))
  end
end
