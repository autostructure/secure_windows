# This class manages V-3453
# Remote Desktop Services must always prompt a client for passwords upon connection.
class secure_windows::stig::v3453 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v3453':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Terminal Services',
      value => 'fPromptForPassword',
      type  => 'dword',
      data  => '1',
    }
  }
}
