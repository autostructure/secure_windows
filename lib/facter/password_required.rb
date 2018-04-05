#
# This fact returns local accounts that do not require a password
#
Facter.add('password_required') do
  confine operatingsystem: :windows
  setcode do
    powershell = 'C:\Windows\system32\WindowsPowerShell\v1.0\powershell.exe'
    command = 'Get-CimInstance -Class Win32_Useraccount -Filter \'PasswordRequired=False and LocalAccount=True and Disabled=False\' | FT Name, PasswordRequired, LocalAccount'
    Facter::Core::Execution.exec(%(#{powershell} -command "#{command}"))
  end
end
