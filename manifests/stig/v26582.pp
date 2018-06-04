# This class manages V-26582
# The System event log size must be configured to 32768 KB or greater.

class secure_windows::stig::v26582 (
  Boolean $enforced = true,
  ) {
    if $enforced {

      registry::value { 'v26582':
        key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EventLog\System',
        value => 'MaxSize',
        type  => 'dword',
        data  => '0x00008000',
      }

    }

  }
