# This class manages V-15727
# Users must be prevented from sharing files in their profiles.

class secure_windows::stig::v15727 (
  Boolean $enforced = true,
) {

  if $enforced {

    registry::value { 'v15727':
      key   => "HKEY_USERS\\${facts['current_sid']}\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer",
      value => 'NoInPlaceSharing',
      type  => 'dword',
      data  => '1',
    }

  }
}
