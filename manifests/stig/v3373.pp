# This class manages V-3373
# The maximum age for machine account passwords must be set to requirements.

class secure_windows::stig::v3373 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v3373':
      key   => 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters',
      value => 'MaximumPasswordAge',
      type  => 'dword',
      data  => '30',
    }

  }
}
