# V-73557
# The System event log size must be configured to 32768 KB or greater.
class secure_windows::stig::v73557 (
  Boolean $enforced = false,
) {

  if $enforced {

    registry::value { 'v73557':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EventLog\System',
      value => 'MaxSize',
      type  => 'dword',
      data  => '0x00008000',
    }

  }

}
