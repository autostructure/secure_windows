Facter.add("windows_domaincontroller") do
  confine :osfamily => "windows"
  setcode do
    powershell = 'C:\Windows\system32\WindowsPowerShell\v1.0\powershell.exe'
    command = 'if ((Get-WindowsFeature -name adds).Installed){ write-host "true" } else { write-host "false" }'
    #Facter::Util::Resolution.exec(%Q{#{powershell} -command "#{command}"})
    Facter::Core::Execution.exec(%Q{#{powershell} -command "#{command}"})
  end
end
