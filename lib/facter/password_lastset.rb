#
# This fact returns the amount of days since the password was changed
#
require 'date'
Facter.add('password_lastset') do
  confine operatingsystem: :windows
  setcode do
    powershell = 'C:\Windows\system32\WindowsPowerShell\v1.0\powershell.exe'

    command = 'Get-Date -Format g'
    getdate = Facter::Core::Execution.exec(%(#{powershell} -command "#{command}"))
    currdate = getdate.match(/\d+\/\d+\/\d+/).to_s
    yr1 = currdate.match(%r{\d\d\d\d$}).to_s
    dy1 = currdate.match(/\/\d+\//).to_s.match(%r{\d+}).to_s
    mo1 = currdate.match(%r{^\d+}).to_s
    currdate = yr1
    currdate << '-'
    currdate << mo1
    currdate << '-'
    currdate << dy1
    date1 = Date.parse(currdate.to_s)

    identity = Facter.value(:identity)
    user = identity['user']
    user = user.match(%r{\w+\s*$})
    command = "Net User #{user} | Find /i \"Password Last Set\""
    getdate = Facter::Core::Execution.execute(command.to_s)
    pwdlastset = getdate.match(/\d+\/\d+\/\d+/).to_s
    yr1 = pwdlastset.match(%r{\d\d\d\d$}).to_s
    dy1 = pwdlastset.match(/\/\d+\//).to_s.match(%r{\d+}).to_s
    mo1 = pwdlastset.match(%r{^\d+}).to_s
    pwdlastset = yr1
    pwdlastset << '-'
    pwdlastset << mo1
    pwdlastset << '-'
    pwdlastset << dy1
    date2 = Date.parse(pwdlastset.to_s)
    # pwdlastset = Date.parse(getdate.to_s)

    days = date1 - date2
    days = days.to_i

    days
  end
end

#    pwdlastset = Facter::Core::Execution.execute("#{powershell} -command \"#{command}\"")
