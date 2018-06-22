#This class manages V-14269
#Mechanisms for removing zone information from file attachments must be hidden
class secure_windows::stig::v14269 (
  Boolean $enforced = true,
) {

  if $enforced {

    registry::value { 'v14269':
      key   => "HKEY_USERS\\${facts['current_sid']}\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\Attachments",
      value => 'HideZoneInfoOnProperties',
      type  => 'dword',
      data  => '1',
    }

  }

}
