#
# This fact returns AD accounts that haven't been logged into in 35 days and are enabled
#
Facter.add('unused_accounts') do
  confine operatingsystem: :windows
  setcode do
    if Facter.value(:windows_server_type) == 'windowsdc'
      powershell = 'C:\Windows\system32\WindowsPowerShell\v1.0\powershell.exe'
      command = 'Search-ADAccount -AccountInactive -UsersOnly -TimeSpan 35.00::00::00 | Where-Object { $_.Enabled -eq $true } | FT SamAccountName -HideTableHeaders'
      Facter::Core::Execution.exec("#{powershell} -command \"#{command}\"")
    else
      require 'win32ole'
      users = []
      wmi = WIN32OLE.connect("winmgmts:\\\\.\\root\\cimv2")
      wmi.ExecQuery("SELECT * FROM Win32_UserAccount").each do |user|
        users.push(user.Name)
      end
      users
    end
    # powershell = 'C:\Windows\system32\WindowsPowerShell\v1.0\powershell.exe'
    # #command = 'Search-ADAccount -AccountInactive -UsersOnly -TimeSpan 35.00::00::00 | Where-Object { $_.Enabled -eq $true } | FT SamAccountName -HideTableHeaders'
    # command = <<-HEREDOC
    # ([ADSI]('WinNT://{0}' -f $env:COMPUTERNAME)).Children | Where { $_.SchemaClassName -eq 'user' } | ForEach {
    #   $user = ([ADSI]$_.Path)
    #   $lastLogin = $user.Properties.LastLogin.Value
    #   $enabled = ($user.Properties.UserFlags.Value -band 0x2) -ne 0x2
    #   $laterdate = (Get-Date).AddDays(35)
    #   if ($lastLogin -eq $null) {
    #     $lastLogin = 'Never'
    #   }
    #   if ($enabled -eq 'True') {
    #     if ($lastLogin -gt $laterdate) {
    #       Write-Host $user.Name
    #     }
    #   }
    # }
    # HEREDOC
    # Facter::Core::Execution.exec("#{powershell} -command \"#{command}\"")
  end
end
