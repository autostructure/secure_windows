# This class manages V-15998
# Users must be prevented from mapping local LPT ports and redirecting
# data from the Remote Desktop Session Host to local LPT ports. (Remote Desktop Services Role).

class secure_windows::stig::v15998 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry_value { 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Terminal Services\fDisableLPT':
      ensure => present,
      type   => 'dword',
      data   => '0x00000001',
    }
  }
}
