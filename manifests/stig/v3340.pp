# This class manages V-3340
# Network shares that can be accessed anonymously must not be allowed.

class secure_windows::stig::v3340 (
  Boolean $enforced = true,
)
{
  if $enforced {
      registry::value { 'v3340':
        key   => 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters',
        value => 'NullSessionShares',
        type  => 'array',
        data  => [''],
      }
    }
  }
