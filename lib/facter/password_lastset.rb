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
    currdate = getdate.match(/\d+\/\d+\/\d+/).to_s
    yr1 = currdate.match(/\d\d\d\d$/).to_s
    mo1 = currdate.match(/\/\d+\//).to_s.match(/\d+/).to_s
    dy1 = currdate.match(/^\d+/).to_s
    currdate = yr1
    currdate << '-'
    currdate << mo1
    currdate << '-'
    currdate << dy1
    puts "currdate string=#{currdate}"
    date1 = Date.parse(currdate.to_s)
    puts "currdate date=#{date1}"

    command = "Net User adminaccount | Find /i \"Password Last Set\""
    getdate = Facter::Core::Execution.execute("#{command}")
    pwdlastset = getdate.match(/\d+\/\d+\/\d+/).to_s
    puts "pwdlastesetdate match=#{pwdlastset}"
    date2 = Date.parse('2018-05-30')
    puts "pwdlastesetdate date=#{date2}"
    #pwdlastset = Date.parse(getdate.to_s)

    days = date2 - date1
    puts "days=#{days}"
    #puts Date.today.between?(date1, date2)

    days

  end
end



#    pwdlastset = Facter::Core::Execution.execute("#{powershell} -command \"#{command}\"")
