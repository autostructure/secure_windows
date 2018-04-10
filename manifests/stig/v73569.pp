# V-73569
# Local drives must be prevented from sharing with Remote Desktop Session Hosts.
class secure_windows::stig::v73569 (
  Boolean $enforced = false,
) {
  if $enforced {

    registry::value { 'v73569':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services',
      value => 'fDisableCdm',
      type  => 'dword',
      data  => '0x00000001',
    }

}
