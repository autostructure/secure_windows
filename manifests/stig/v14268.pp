#This class manages V-14268
#Zone information must be preserved when saving attachments
class secure_windows::stig::v14268 (
  Boolean $enforced = true,
) {

  if $enforced {

    registry::value { 'v14268':
      key   => "HKEY_USERS\\${facts['current_sid']}\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\Attachments",
      value => 'SaveZoneInformation',
      type  => 'dword',
      data  => '2',
    }

  }
}
