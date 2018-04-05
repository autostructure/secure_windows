#
# This fact returns local volumes that are not NTFS or ReFS
#
Facter.add('volume_filesystem') do
  confine operatingsystem: :windows
  setcode do
    powershell = 'C:\Windows\system32\WindowsPowerShell\v1.0\powershell.exe'
    command = 'Get-Volume | Select FileSystem'
    $filesystems = Facter::Core::Execution.exec(%(#{powershell} -command "#{command}"))
    $filesystems.spit("\n")
    #$filesystems.match(/MaxConnIdleTime=(\d*)/)[1]
  end
end
