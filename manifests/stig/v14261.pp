#This class manages V-14261
#Windows must be prevented from using Windows Update to search for drivers.
class secure_windows::stig::v14261 (
  Boolean $enforced = true,
) {

  if $enforced {

    registry::value { 'v14261':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\DriverSearching',
      value => 'DontSearchWindowsUpdate',
      type  => 'dword',
      data  => '0x00000001',
    }

  }

}
