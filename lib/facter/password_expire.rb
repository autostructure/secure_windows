#
# This fact returns local accounts that do not have a password expiration
#
Facter.add('password_expire') do
  confine operatingsystem: :windows
  setcode do
    powershell = 'C:\Windows\system32\WindowsPowerShell\v1.0\powershell.exe'
    command = 'Get-CimInstance -Class Win32_Useraccount -Filter \'PasswordExpires=False and LocalAccount=True and Disabled=False\' | FT Name'
    Facter::Core::Execution.exec(%(#{powershell} -command "#{command}"))
  end
end
