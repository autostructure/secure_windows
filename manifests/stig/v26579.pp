# This class manages V-26579
# The Application event log size must be configured to 32768 KB or greater.

class secure_windows::stig::v26579 (
  Boolean $enforced = true,
  ) {
    if $enforced {

      registry::value { 'v26579':
        key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application',
        value => 'MaxSize',
        type  => 'dword',
        data  => '0x00008000',
      }

    }

  }
