# This class manages V-26581
# The Setup event log size must be configured to 32768 KB or greater.

class secure_windows::stig::v26581 (
  Boolean $enforced = true,
  ) {
    if $enforced {

      registry::value { 'v26581':
        key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EventLog\Setup',
        value => 'MaxSize',
        type  => 'dword',
        data  => '0x00008000',
      }

    }

  }
