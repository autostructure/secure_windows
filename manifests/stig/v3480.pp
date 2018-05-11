# This class manages V-3480
# Windows Media Player must be configured to prevent automatic checking for updates.
class secure_windows::stig::v3480 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v3480':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsMediaPlayer',
      value => 'DisableAutoupdate',
      type  => 'dword',
      data  => '1',
    }
  }
}
