#
# This fact returns the domain SID
#
Facter.add('organizational_units') do
  confine operatingsystem: :windows
  setcode do
    powershell = 'C:\Windows\system32\WindowsPowerShell\v1.0\powershell.exe'
    command = "Get-ADObject -Filter { ObjectClass -eq 'organizationalunit' } | FT Name -HideTableHeaders"
    $ou_list = Facter::Core::Execution.exec(%(#{powershell} -command "#{command}"))
    $ou_list.split("\r\n")
  end
end
