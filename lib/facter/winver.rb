# This fact returns the ftp root of a FTP Server with a site equal to fqdn
require 'facter'
Facter.add('winver') do
  confine operatingsystem: :windows
  setcode do
    metric = ''
    powershell = 'C:\Windows\system32\WindowsPowerShell\v1.0\powershell.exe'
    command = '[environment]::OSVersion.Version | select Major, Minor, Build | FT -HideTableHeaders -AutoSize'
    out = Facter::Core::Execution.execute("#{powershell} -command \"#{command}\"")
    out = out.split("\s")
    metric = out[0] + '.' + out[1] + '.' + out[2]
  end
end
