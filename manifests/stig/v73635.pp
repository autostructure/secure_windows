# V-73635
# The setting Domain member: Digitally encrypt secure channel data (when possible) must be configured to enabled.
class secure_windows::stig::v73635 (
  Boolean $enforced = false,
) {

  if $enforced {

    registry::value { 'v73635':
      key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters',
      value => 'SealSecureChannel',
      type  => 'dword',
      data  => '0x00000001',
    }

  }

}
