# This class manages V-15997
# Users must be prevented from mapping local COM ports and redirecting data from
# the Remote Desktop Session Host to local COM ports. (Remote Desktop Services Role).

class secure_windows::stig::v15997 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry_value { 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Terminal Services\fDisableCcm':
      ensure => present,
      type   => 'dword',
      data   => '0x00000001',
    }
  }
}
