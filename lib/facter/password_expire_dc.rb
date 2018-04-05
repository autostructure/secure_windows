#
# This fact returns AD accounts that do not have a password expiration
#
Facter.add('password_expire_dc') do
  confine operatingsystem: :windows
  setcode do
    powershell = 'C:\Windows\system32\WindowsPowerShell\v1.0\powershell.exe'
    command = 'Search-ADAccount -PasswordNeverExpires -UsersOnly | FT Name, PasswordNeverExpires, Enabled'
    Facter::Core::Execution.exec(%(#{powershell} -command "#{command}"))
  end
end
