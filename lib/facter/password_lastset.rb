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
    puts "currdate string=#{currdate}"
    date1 = currdate.to_d
    puts "currdate date=#{date1}"

    command = "Net User adminaccount | Find /i \"Password Last Set\""
    getdate = Facter::Core::Execution.execute("#{command}")
    pwdlastset = getdate.match(/\d+\/\d+\/\d+/).to_s
    puts "pwdlastesetdate match=#{pwdlastset}"
    date2 = pwdlastset.to_d
    puts "pwdlastesetdate date=#{date2}"
    #pwdlastset = Date.parse(getdate.to_s)

    puts date2 - date1
    puts Date.today.between?(date1, date2)

    5

  end
end



#    pwdlastset = Facter::Core::Execution.execute("#{powershell} -command \"#{command}\"")
