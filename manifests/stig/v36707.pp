# This class manages V-36707
# Windows SmartScreen must be configured to require approval from an administrator before running
# downloaded unknown software on Windows 2012/2012 R2.
class secure_windows::stig::v36707 (
  Boolean $enforced = true,
) {
  if $enforced {

    registry_value { 'HKEY_LOCAL_MACHINE \SOFTWARE\Policies\Microsoft\Windows\System\EnableSmartScreen':
      ensure => present,
      type   => 'dword',
      data   => '0x00000002',
    }
  }
}
