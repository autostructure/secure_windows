#
# This fact returns the PKI Personal Certs on the machine
#
Facter.add('pki_certs') do
  confine operatingsystem: :windows
  setcode do
    powershell = 'C:\Windows\system32\WindowsPowerShell\v1.0\powershell.exe'
    command = 'Import-Module PKI; set-location cert:\localmachine\My; get-childitem'
    Facter::Core::Execution.exec(%(#{powershell} -command "#{command}"))
  end
end
