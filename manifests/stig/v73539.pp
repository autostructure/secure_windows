# V-73539
# Users must be prompted to authenticate when the system wakes from sleep (plugged in).
class secure_windows::stig::v73539 (
  Boolean $enforced = false,
) {

  if $enforced {

    registry::value { 'v73539':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51',
      value => 'ACSettingIndex',
      type  => 'dword',
      data  => '0x00000001',
    }

  }

}
