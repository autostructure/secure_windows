#This class manages V-1166
#The Windows SMB client must be enabled to perform SMB packet signing when possible.
class secure_windows::stig::v1166 (
  Boolean $enforced = true,
) {

  if $enforced {

    registry::value { 'v1166':
      key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters',
      value => 'EnableSecuritySignature',
      type  => 'dword',
      data  => '0x00000001',
    }

  }

}
