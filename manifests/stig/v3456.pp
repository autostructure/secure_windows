# This class manages V-3456
# Remote Desktop Services must delete temporary folders when a session is terminated.
class secure_windows::stig::v3456 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v3456':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Terminal Services',
      value => 'DeleteTempDirsOnExit',
      type  => 'dword',
      data  => '1',
    }
  }
}
