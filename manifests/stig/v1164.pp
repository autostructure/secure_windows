#This class manages V-1164
#Outgoing secure channel traffic must be signed when possible.
class secure_windows::stig::v1164 (
  Boolean $enforced = true,
) {

  if $enforced {

    registry::value { 'v1164':
      key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters',
      value => 'SignSecureChannel',
      type  => 'dword',
      data  => '0x00000001',
    }

  }

}
