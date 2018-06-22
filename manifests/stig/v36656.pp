# This class manages V-36656
# A screen saver must be enabled on the system

class secure_windows::stig::v36656 (
  Boolean $enforced = true,
) {

  if $enforced {

    registry::value { 'v36656':
      key   => "HKEY_USERS\\${facts['current_sid']}\\Software\\Policies\\Microsoft\\Windows\\Control Panel\\Desktop",
      value => 'ScreenSaveActive',
      type  => 'string',
      data  => '1',
    }

  }
}
