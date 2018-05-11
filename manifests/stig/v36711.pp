# This class manages V-36711
# The Windows Store application must be turned off.
class secure_windows::stig::v36711 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v36711':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsStore',
      value => 'RemoveWindowsStore',
      type  => 'dword',
      data  => '0x00000001',
    }
  }
}
