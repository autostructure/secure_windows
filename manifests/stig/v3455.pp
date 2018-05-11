# This class manages V-3455
# Remote Desktop Services must be configured to use session-specific temporary folders.
class secure_windows::stig::v3455 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v3455':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Terminal Services',
      value => 'PerSessionTempDir',
      type  => 'dword',
      data  => '1',
    }
  }
}
