# This fact returns the MaxConnIdleTime for DCs
require 'facter'
Facter.add('maxconnidletime') do
  confine operatingsystem: :windows
  setcode do
    powershell = 'C:\Windows\system32\WindowsPowerShell\v1.0\powershell.exe'
    command = "write ((Get-ADObject -SearchBase \"CN=Query-Policies,CN=Directory Service,CN=Windows NT,CN=Services,CN=Configuration,DC=example,DC=com\" -Filter 'ObjectClass -like \"queryPolicy\"' -Properties ldapadminlimits).ldapadminlimits -like \"MaxConnIdleTime*\")"
    $time = Facter::Core::Execution.execute("#{powershell} -command \"#{command}\"")
    $time[/^MaxConnIdleTime=(.*)/]
  end
end
