# This class manages V-36657
# The screen saver must be password protected.
class secure_windows::stig::v36657 (
  Boolean $enforced = true,
) {
  if $enforced{
  registry::value { 'v36657':
    key   => "HKEY_USERS\\${facts['current_sid']}\\Software\\Policies\\Microsoft\\Windows\\Control Panel\\Desktop",
    value => 'ScreenSaverIsSecure',
    type  => 'string',
    data  => '1',
    }
  }
}
