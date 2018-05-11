# This class manages V-36678
# Device driver updates must only search managed servers, not Windows Update.
class secure_windows::stig::v36678 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v36678':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\DriverSearching',
      value => 'DriverServerSelection',
      type  => 'dword',
      data  => '0x00000001',
    }
  }
}
