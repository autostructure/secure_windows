# V-73663
# The setting Microsoft network server: Digitally sign communications (if client agrees) must be configured to Enabled.
class secure_windows::stig::v73663 (
  Boolean $enforced = false,
) {

  if $enforced {

    registry::value { 'v73663':
      key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanManServer\Parameters',
      value => 'EnableSecuritySignature',
      type  => 'dword',
      data  => '0x00000001',
    }

  }

}
