# V-73661
# The setting Microsoft network server: Digitally sign communications (always) must be configured to Enabled.
class secure_windows::stig::v73661 (
  Boolean $enforced = false,
) {

  if $enforced {

    registry::value { 'v73661':
      key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanManServer\Parameters',
      value => 'RequireSecuritySignature',
      type  => 'dword',
      data  => '0x00000001',
    }

  }

}
