# This class manages V-3374
# The system must be configured to require a strong session key.

class secure_windows::stig::v3374 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry_value { 'HKLM\System\CurrentControlSet\Services\Netlogon\Parameters\RequireStrongKey':
      ensure => present,
      type   => 'dword',
      data   => '1',
    }

  }
}
