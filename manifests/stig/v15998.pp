# This class manages V-15998
# Users must be prevented from mapping local LPT ports and redirecting
# data from the Remote Desktop Session Host to local LPT ports. (Remote Desktop Services Role).

class secure_windows::stig::v15998 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v15998':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Terminal Services',
      value => 'fDisableLPT',
      type  => 'dword',
      data  => '1',
    }
  }
}
