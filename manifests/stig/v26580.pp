# This class manages V-26580
# The Security event log size must be configured to 196608 KB or greater.

class secure_windows::stig::v26580 (
  Boolean $enforced = true,
  ) {
    if $enforced {

      registry::value { 'v26580':
        key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EventLog\Security',
        value => 'MaxSize',
        type  => 'dword',
        data  => '0x00030000',
      }

    }

  }
