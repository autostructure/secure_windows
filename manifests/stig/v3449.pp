# This class manages V-3449
# Remote Desktop Services must limit users to one remote session.
class secure_windows::stig::v3449 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v3449':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Terminal Services',
      value => 'fSingleSessionPerUser',
      type  => 'dword',
      data  => '1',
    }
  }
}
