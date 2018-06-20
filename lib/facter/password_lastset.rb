#
# This fact returns the last date the password was changed
#

Facter.add('password_lastset') do
  confine operatingsystem: :windows
  setcode do
    powershell = 'C:\Windows\system32\WindowsPowerShell\v1.0\powershell.exe'

    command = 'Get-Date -Format g'
    currdate = Facter::Core::Execution.exec(%(#{powershell} -command "#{command}"))
    currdate.match(/\d+\/\d+\/\d+/)

    command = "Net User adminaccount | Find /i \"Password Last Set\""
    pwdlastset = Facter::Core::Execution.execute("#{command}")
    pwdlastset.match(/\d+\/\d+\/\d+/)

    pwdlastset - currdate

  end
end



#    pwdlastset = Facter::Core::Execution.execute("#{powershell} -command \"#{command}\"")
