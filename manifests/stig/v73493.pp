# V-73493
# The display of slide shows on the lock screen must be disabled.
class secure_windows::stig::v73493 (
  Boolean $enforced = false,
) {
  if $enforced {
    registry::value { 'v73493':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Personalization',
      value => 'NoLockScreenSlideshow',
      type  => 'dword',
      data  => '0x00000001',
    }
  }
}
