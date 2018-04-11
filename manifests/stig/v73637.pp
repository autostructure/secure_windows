# V-73637
# The setting Domain member: Digitally sign secure channel data (when possible) must be configured to Enabled.
class secure_windows::stig::v73637 (
  Boolean $enforced = false,
) {

  if $enforced {

    registry::value { 'v73637':
      key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters',
      value => 'SignSecureChannel',
      type  => 'dword',
      data  => '0x00000001',
    }

  }

}
