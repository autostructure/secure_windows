#This class manages V-1163
# Outgoing secure channel traffic must be encrypted when possible.
class secure_windows::stig::v1163 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v1163':
      key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters',
      value => 'SealSecureChannel',
      type  => 'dword',
      data  => '0x00000001',
    }

  }
}
