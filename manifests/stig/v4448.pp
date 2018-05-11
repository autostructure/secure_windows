# This class manages V-4448
# Group Policy objects must be reprocessed even if they have not changed.
class secure_windows::stig::v4448 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v4448':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}',
      value => 'NoGPOListChanges',
      type  => 'dword',
      data  => '0x00000000',
    }
  }
}
