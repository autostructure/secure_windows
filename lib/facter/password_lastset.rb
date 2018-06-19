#
# This fact returns the last date the password was changed
#

Facter.add('password_lastset') do
  confine operatingsystem: :windows
  setcode do
    powershell = 'C:\Windows\system32\WindowsPowerShell\v1.0\powershell.exe'
    command = 'Net User adminaccount | Find /i "Password Last Set'
    puts "#{command}"
    pwdlastset = Facter::Core::Execution.execute("#{command}")
#    pwdlastset.match(/\S+\s\S+\s\S+$/)
  end
end



#    pwdlastset = Facter::Core::Execution.execute("#{powershell} -command \"#{command}\"")
