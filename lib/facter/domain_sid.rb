#
# This fact returns the domain SID
#
Facter.add('domain_sid') do
  confine operatingsystem: :windows
  setcode do
    powershell = 'C:\Windows\system32\WindowsPowerShell\v1.0\powershell.exe'
    command = 'Get-ADDomain | FT DomainSID -HideTableHeaders'
    Facter::Core::Execution.exec(%(#{powershell} -command "#{command}"))
  end
end
