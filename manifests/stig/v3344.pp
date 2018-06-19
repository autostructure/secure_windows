# This class manages V-3344
# Local accounts with blank passwords must be restricted to prevent access from the network.

class secure_windows::stig::v3344 (
  Boolean $enforced = true,
)
{
  if $enforced {
      registry::value { 'v3344':
        key   => 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa',
        value => 'LimitBlankPasswordUse',
        type  => 'dword',
        data  => '1',
      }
    }
  }
