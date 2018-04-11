# V-73633
# The setting Domain member: Digitally encrypt or sign secure channel data (always) must be configured to Enabled.
class secure_windows::stig::v73633 (
  Boolean $enforced = false,
) {

  if $enforced {

    registry::value { 'v73633':
      key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters',
      value => 'RequireSignOrSeal',
      type  => 'dword',
      data  => '0x00000001',
    }

  }

}
