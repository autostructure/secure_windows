# V-73559
# Windows SmartScreen must be enabled.
class secure_windows::stig::v73559 (
  Boolean $enforced = false,
) {

  if $enforced {

    registry::value { 'v73559':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System',
      value => 'EnableSmartScreen',
      type  => 'dword',
      data  => '0x00000001',
    }

  }

}
