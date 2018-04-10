# V-73657
# Unencrypted passwords must not be sent to third-party Server Message Block (SMB) servers.
class secure_windows::stig::v73657 (
  Boolean $enforced = false,
) {

  if $enforced {

    registry::value { 'v73657':
      key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters',
      value => 'EnablePlainTextPassword',
      type  => 'dword',
      data  => '0x00000000',
    }

  }

}
