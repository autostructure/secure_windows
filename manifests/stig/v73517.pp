# V-73517
# Virtualization-based protection of code integrity must be enabled on domain-joined systems.
class secure_windows::stig::v73517 (
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

}
