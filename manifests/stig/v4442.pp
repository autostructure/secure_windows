# This class manages V-4442
# The system must be configured to have password protection take effect within a limited time frame when the screen saver becomes active.
class secure_windows::stig::v4442 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v4442':
      key   => 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon',
      value => 'ScreenSaverGracePeriod',
      type  => 'string',
      data  => '5',
    }
  }
}
