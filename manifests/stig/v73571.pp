# V-73571
# Remote Desktop Services must always prompt a client for passwords upon connection.
class secure_windows::stig::v73571 (
  Boolean $enforced = false,
) {

  if $enforced {

    registry::value { 'v73571':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services',
      value => 'fPromptForPassword',
      type  => 'dword',
      data  => '0x00000001',
    }

  }

}
