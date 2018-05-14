#This class manages V-14249
#Local drives must be prevented from sharing with Remote Desktop Session Hosts. (Remote Desktop Services Role)
class secure_windows::stig::v14249 (
  Boolean $enforced = true,
) {

  if $enforced {

    registry::value { 'v14249':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services',
      value => 'fDisableCdm',
      type  => 'dword',
      data  => '0x00000001',
    }

  }

}
