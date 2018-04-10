# V-73553
# The Application event log size must be configured to 32768 KB or greater.
class secure_windows::stig::v73553 (
  Boolean $enforced = false,
) {
  if $enforced {

    registry::value { 'v73553':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application',
      value => 'MaxSize',
      type  => 'dword',
      data  => '0x00008000',
    }

}
