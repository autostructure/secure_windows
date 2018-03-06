Facter.add("windows_domaincontroller") do
  confine :osfamily => "windows"
  setcode do
    powershell = 'C:\Windows\system32\WindowsPowerShell\v1.0\powershell.exe'
    command = 'if (Get-WindowsFeature -name adds).Installed){ write-host 1; exit 1 }else{ write-host 0; exit 0 }'
    Facter::Util::Resolution.exec(%Q{#{powershell} -command "#{command}"})
  end
end
