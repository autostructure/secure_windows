# Custom fact displaying the state of Microsoft Defender Credential Guard property:
# VirtualizationBasedSecurityStatus
#
Facter.add(:credential_guard_virtualizationbasedsecuritystatus) do
  confine operatingsystem: :windows

  setcode do
    powershell = File.exist?("#{ENV['SYSTEMROOT']}\\system32\\windowspowershell\\v1.0\\powershell.exe") ? "#{ENV['SYSTEMROOT']}\\system32\\windowspowershell\\v1.0\\powershell.exe" : 'powershell.exe'
    command = 'Get-CimInstance -ClassName Win32_DeviceGuard -Namespace root\Microsoft\Windows\DeviceGuard | select VirtualizationBasedSecurityStatus | FT -HideTableHeaders'
    Facter::Core::Execution.exec(%(#{powershell} -command "#{command}"))
  end
end
