# This fact returns the ftp root of a FTP Server with a site equal to fqdn
require 'facter'
Facter.add('ftp_root') do
  confine operatingsystem: :windows
  setcode do
    powershell = 'C:\Windows\system32\WindowsPowerShell\v1.0\powershell.exe'
    command = "[Void][Reflection.Assembly]::LoadWithPartialName(\"Microsoft.Web.Administration\"); write ((((New-Object Microsoft.Web.Administration.ServerManager).Sites | where { $_.Name -eq \"#{Facter.value(:fqdntest)}\" }).Applications | where { $_.Path -eq \"/\" }).VirtualDirectories | where { $_.Path -eq \"/\" }).PhysicalPath"
    Facter::Core::Execution.exec(%(#{powershell} -command "#{command}"))
  end
end
