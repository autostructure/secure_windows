# This class manages V-3338
# Named pipes that can be accessed anonymously must be configured with limited values on domain controllers.

class secure_windows::stig::v3338 (
  Boolean $enforced = true,
)
{
  if $enforced {
    if($facts['windows_server_type'] == 'windowsdc') {
      registry_value { 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters\NullSessionPipes':
        ensure => present,
        type   => 'array',
        data   => 'netlogon, samr, lsarpc',
          }

      # registry::value { 'v3338':
      #   key   => 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters',
      #   value => 'NullSessionPipes',
      #   type  => 'array',
      #   data  => 'netlogon, samr, lsarpc',
      # }
    }
    else {
      registry_value { 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters\NullSessionPipes':
        ensure => present,
        type   => 'array',
        data   => [],
          }
        }
      }
    }
