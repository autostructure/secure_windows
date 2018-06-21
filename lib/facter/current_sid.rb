#
# This fact returns the SID of the current user
#

Facter.add('current_sid') do
  confine operatingsystem: :windows
  setcode do
    powershell = 'C:\Windows\system32\WindowsPowerShell\v1.0\powershell.exe'
    command = 'Add-Type -AssemblyName System.DirectoryServices.AccountManagement'
    Facter::Core::Execution.execute("#{powershell} -command \"#{command}\"")
    command = 'return ([System.DirectoryServices.AccountManagement.UserPrincipal]::Current).SID.Value'
    Facter::Core::Execution.execute("#{powershell} -command \"#{command}\"")
  end
end
