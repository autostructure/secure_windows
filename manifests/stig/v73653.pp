# V-73653
# The setting Microsoft network client: Digitally sign communications (always) must be configured to Enabled.
class secure_windows::stig::v73653 (
  Boolean $enforced = false,
) {

  if $enforced {

    registry::value { 'v73653':
      key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters',
      value => 'RequireSecuritySignature',
      type  => 'dword',
      data  => '0x00000001',
    }

  }

}
