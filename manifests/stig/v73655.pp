# V-73655
# The setting Microsoft network client: Digitally sign communications (if server agrees) must be configured to Enabled.
class secure_windows::stig::v73655 (
  Boolean $enforced = false,
) {

  if $enforced {

    registry::value { 'v73655':
      key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters',
      value => 'EnableSecuritySignature',
      type  => 'dword',
      data  => '0x00000001',
    }

  }

}
