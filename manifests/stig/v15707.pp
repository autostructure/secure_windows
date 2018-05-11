# This class manages V-15707
# This setting will turn on session logging for Remote Assistance connections.
class secure_windows::stig::v15707 (
  Boolean $enforced = true,
) {
  if $enforced {

    registry::value { 'v15707':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Terminal Services',
      value => 'LoggingEnabled',
      type  => 'dword',
      data  => '0x00000001',
    }

  }
}
