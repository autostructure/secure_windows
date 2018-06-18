# This class manages V-3374
# The system must be configured to require a strong session key.

class secure_windows::stig::v3374 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v3374':
      key   => 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters',
      value => 'RequireStrongKey',
      type  => 'dword',
      data  => '1',
    }

  }
}
