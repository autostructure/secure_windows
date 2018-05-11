# This class manages V-3379
# The system must be configured to prevent the storage of the LAN Manager hash of passwords.
class secure_windows::stig::v3379 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v3379':
      key   => 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa',
      value => 'NoLMHash',
      type  => 'dword',
      data  => '1',
    }
  }
}
