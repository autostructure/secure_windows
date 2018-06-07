#This class manages V-1162
#The Windows SMB server must perform SMB packet signing when possible.
class secure_windows::stig::v1162 (
  Boolean $enforced = true,
) {
  if $enforced {

    registry_value { 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters\EnableSecuritySignature':
      ensure => present,
      type   => 'dword',
      data   => '0x00000001',
    }
  }
}
