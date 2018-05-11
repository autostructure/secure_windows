# This class manages V-36687
# App notifications on the lock screen must be turned off.
class secure_windows::stig::v36687 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v36687':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\System',
      value => 'DisableLockScreenAppNotifications',
      type  => 'dword',
      data  => '0x00000000',
    }
  }
}
