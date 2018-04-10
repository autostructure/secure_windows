# V-73513
# Virtualization-based security must be enabled with the platform security level configured to Secure Boot or Secure Boot with DMA Protection.
class secure_windows::stig::v73513 (
  Boolean $enforced = false,
) {
  if $enforced {

    # TODO: other steps to complete.
    registry::value { 'v73513-1':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard',
      value => 'EnableVirtualizationBasedSecurity',
      type  => 'dword',
      data  => '0x00000001',
    }

    registry::value { 'v73513-2':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard',
      value => 'RequirePlatformSecurityFeatures',
      type  => 'dword',
      data  => '0x00000001',
    }

}
