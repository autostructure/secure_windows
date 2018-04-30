#
# This fact returns thumbprints of PKI Personal Certs on the machine
#
Facter.add('pki_certs') do
  confine operatingsystem: :windows
  setcode do
    powershell = 'C:\Windows\system32\WindowsPowerShell\v1.0\powershell.exe'
    command = 'Import-Module PKI; set-location cert:\localmachine\My; get-childitem | FT Thumbprint -HideTableHeaders'
    result = Facter::Core::Execution.exec(%(#{powershell} -command "#{command}"))
    none = 'no certs'
    if result != ''
      result
    else
      none
    end
  end
end
