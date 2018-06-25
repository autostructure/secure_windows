# This class manages V-36777
# Toast notifications to the lock screen must be turned off.
class secure_windows::stig::v36777 (
  Boolean $enforced = true,
) {
  if $enforced {
  registry::value { 'v36777':
    key   => "HKEY_USERS\\${facts['current_sid']}\\Software\\Policies\\Microsoft\\Windows\\CurrentVersion\\PushNotifications",
    value => 'NoToastApplicationNotificationOnLockScreen',
    type  => 'dword',
    data  => '1',
    }
  }
}
