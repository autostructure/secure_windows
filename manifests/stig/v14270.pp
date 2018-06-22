# This class manages V-14270
# The system must notify antivirus when file attachments are opened.

class secure_windows::stig::v14270 (
  Boolean $enforced = true,
) {

  if $enforced {

    registry::value { 'v14270':
      key   => "HKEY_USERS\\${facts['current_sid']}\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\Attachments",
      value => 'ScanWithAntiVirus',
      type  => 'dword',
      data  => '3',
    }

  }
}
