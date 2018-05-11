# This class manages V-15705
# Authentication must always be required when accessing a system.
# This setting ensures the user is prompted for a password on resume from sleep (on battery).
class secure_windows::stig::v15705 (
  Boolean $enforced = true,
) {
  if $enforced {

    registry::value { 'v15705':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51',
      value => 'DCSettingIndex',
      type  => 'dword',
      data  => '0x00000001',
    }

  }
}
