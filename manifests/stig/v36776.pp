# This class manages V-36776
# Notifications from Windows Push Network Service must be turned off.
class secure_windows::stig::v36776 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v36776':
      key   => 'HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications',
      value => 'NoCloudApplicationNotification',
      type  => 'dword',
      data  => '0x00000001',
    }
  }
}
