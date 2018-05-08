# This class manages V-1083
# Anonymous enumeration of shares must be restricted.
class secure_windows::stig::v1093 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v1093':
      key   => 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa',
      value => 'RestrictAnonymous',
      type  => 'dword',
      data  => '1',
    }
  }
}
