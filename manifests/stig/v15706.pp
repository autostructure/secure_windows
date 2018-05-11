# This class manages V-15706
# Authentication must always be required when accessing a system.
# This setting ensures the user is prompted for a password on resume from sleep (plugged in).
class secure_windows::stig::v15706 (
  Boolean $enforced = true,
) {
  if $enforced {

    registry::value { 'v15706':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51',
      value => 'ACSettingIndex',
      type  => 'dword',
      data  => '0x00000001',
    }

  }
}
