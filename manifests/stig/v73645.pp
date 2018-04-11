# V-73645
# The machine inactivity limit must be set to 15 minutes, locking the system with the screen saver.
class secure_windows::stig::v73645 (
  Boolean $enforced = false,
) {

  if $enforced {

    registry::value { 'v73645':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System',
      value => 'InactivityTimeoutSecs',
      type  => 'dword',
      data  => '0x00000384',
    }

  }

}
