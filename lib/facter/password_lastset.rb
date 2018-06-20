#
# This fact returns the last date the password was changed
#
require 'date'
Facter.add('password_lastset') do
  confine operatingsystem: :windows
  setcode do
    powershell = 'C:\Windows\system32\WindowsPowerShell\v1.0\powershell.exe'

    command = 'Get-Date -Format g'
    getdate = Facter::Core::Execution.exec(%(#{powershell} -command "#{command}"))
    getdate = getdate.match(/\d+\/\d+\/\d+/)
    currdate = Date.parse(getdate)

    command = "Net User adminaccount | Find /i \"Password Last Set\""
    getdate = Facter::Core::Execution.execute("#{command}")
    getdate = getdate.match(/\d+\/\d+\/\d+/)
    pwdlastset = Date.parse(getdate)

    puts pwdlastset - currdate
    puts Date.today.between?(currdate, pwdlastset)

    pwdlastset - currdate

  end
end



#    pwdlastset = Facter::Core::Execution.execute("#{powershell} -command \"#{command}\"")
