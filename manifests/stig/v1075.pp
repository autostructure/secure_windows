# This class manages V-1075
# The shutdown option must not be available from the logon dialog box.
class secure_windows::stig::v1075 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v1075':
      key   => 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System',
      value => 'ShutdownWithoutLogon',
      type  => 'dword',
      data  => '0x00000001',
    }
  }
}
