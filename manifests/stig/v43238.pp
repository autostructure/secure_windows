# This class manages V-43238
# The display of slide shows on the lock screen must be disabled (Windows 2012 R2).
class secure_windows::stig::v43238 (
  Boolean $enforced = true,
) {
  if $enforced {
    if $facts['operatingsystemmajrelease'] == '2012 R2' {
      registry::value { 'v43238':
        key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Personalization',
        value => 'NoLockScreenSlideshow',
        type  => 'dword',
        data  => '0x00000001',
      }
    }
  }
}
