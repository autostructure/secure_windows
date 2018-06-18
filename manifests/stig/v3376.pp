# This class manages V-3376
# The system must be configured to prevent the storage of passwords and credentials.

class secure_windows::stig::v3376 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v3376':
      key   => 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa',
      value => 'DisableDomainCreds',
      type  => 'dword',
      data  => '1',
    }

  }
}
