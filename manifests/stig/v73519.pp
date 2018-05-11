# This class manages V-73519
# The Server Message Block (SMB) v1 protocol must be disabled on the SMB server.
class secure_windows::stig::v73519 (
  Boolean $enforced = true,
) {
  if $enforced {
    include ::secure_windows::administrative_template_secguide_installer

    registry::value { 'v73519':
      key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters',
      value => 'SMB1',
      type  => 'dword',
      data  => '0x00000000',
    }
  }
}
