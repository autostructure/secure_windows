# V-73555
# The Security event log size must be configured to 196608 KB or greater.
class secure_windows::stig::v73555 (
  Boolean $enforced = false,
) {

  if $enforced {

    registry::value { 'v73555':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EventLog\Security',
      value => 'MaxSize',
      type  => 'dword',
      data  => '0x00030000',
    }

  }

}
