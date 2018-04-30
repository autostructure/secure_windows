# V-73521
# Early Launch Antimalware, Boot-Start Driver Initialization Policy must prevent boot drivers identified as bad.
class secure_windows::stig::v73521 (
  Boolean $enforced = false,
  Enum['1','3','8'] $driverloadpolicy = '1',
) {

  if $enforced {

    $driverloadpolicyval = $driverloadpolicy ? {
      '1' => '0x00000001',
      '3' => '0x00000003',
      '8' => '0x00000008',
    }

    registry::value { 'v73521':
      key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Policies\EarlyLaunch',
      value => 'DriverLoadPolicy',
      type  => 'dword',
      data  => $driverloadpolicyval,
    }

  }

}
