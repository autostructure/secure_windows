# This class manages V-36687
# App notifications on the lock screen must be turned off.
class secure_windows::stig::v36687 (
  Boolean $enforced = true,
) {
  if $enforced {

    registry_value { 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\System\DisableLockScreenAppNotifications':
      ensure => present,
      type   => 'dword',
      data   => '0x00000001',
    }
  }
}
