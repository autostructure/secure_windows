# This class manages V-3373
# The maximum age for machine account passwords must be set to requirements.

class secure_windows::stig::v3373 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry_value { 'HKLM\System\CurrentControlSet\Services\Netlogon\Parameters\MaximumPasswordAge':
      ensure => present,
      type   => 'dword',
      data   => '30',
    }

  }
}
