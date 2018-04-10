# V-73521
# Early Launch Antimalware, Boot-Start Driver Initialization Policy must prevent boot drivers identified as bad.
class secure_windows::stig::v73521 (
  Boolean $enforced = false,
) {
  if $enforced {

    registry::value { 'v73517':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard',
      value => 'HypervisorEnforcedCodeIntegrity',
      type  => 'dword',
      data  => '0x00000001',
    }

}
