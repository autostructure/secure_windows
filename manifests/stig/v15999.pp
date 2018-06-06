# This class manages V-15999
# Users must be prevented from redirecting Plug and Play devices to the Remote Desktop Session Host. (Remote Desktop Services Role).

class secure_windows::stig::v15999 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v15999':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Terminal Services',
      value => 'fDisablePNPRedir',
      type  => 'dword',
      data  => '1',
    }
  }
}
