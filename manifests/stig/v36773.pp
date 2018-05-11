# This class manages V-36773
# The machine inactivity limit must be set to 15 minutes, locking the system with the screensaver.
class secure_windows::stig::v36773 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v36773':
      key   => 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System',
      value => 'InactivityTimeoutSecs',
      type  => 'dword',
      data  => '0x00000384',
    }
  }
}
