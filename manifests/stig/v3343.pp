# This class manages V-3343
# Solicited Remote Assistance must not be allowed.

class secure_windows::stig::v3343 (
  Boolean $enforced = true,
)
{
  if $enforced {
      registry::value { 'v3343':
        key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Terminal Services',
        value => 'fAllowToGetHelp',
        type  => 'dword',
        data  => '0',
      }
    }
  }
