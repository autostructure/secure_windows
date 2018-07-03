# This class manages V-3339
# Unauthorized remotely accessible registry paths must not be configured.

class secure_windows::stig::v3339 (
  Boolean $enforced = true,
)
{
  if $enforced {
      registry::value { 'v3339':
        key   => 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\SecurePipeServers\Winreg\AllowedExactPaths',
        value => 'Machine',
        type  => 'array',
        data  => ['System\CurrentControlSet\Control\ProductOptions','System\CurrentControlSet\Control\Server Applications',
        'Software\Microsoft\Windows NT\CurrentVersion'],
      }
    }
  }
