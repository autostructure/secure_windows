#This class manages V-14268
#Zone information must be preserved when saving attachments
class secure_windows::stig::v14268 (
  Boolean $enforced = true,
) {

  if $enforced {

    $key = "HKEY_USERS\\${facts['current_sid']}\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\Attachments",
    ::secure_windows::log { "key=${key}": }
    registry::value { 'v14268':
      key   => $key,
      value => 'SaveZoneInformation',
      type  => 'dword',
      data  => '2',
    }

  #  registry_value { "HKEY_USERS\${facts['current_sid']}\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments\SaveZoneInformation":
  #    ensure => present,
  #    type   => 'dword',
  #    data   => '2',
  #    }

  }
}
