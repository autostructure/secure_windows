#This class manages V-1162
#The Windows SMB server must perform SMB packet signing when possible.
class secure_windows::stig:v1162 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v1162':
      key   => 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters',
      value => 'EnableSecuritySignature',
      type  => 'dword',
      data  => '1',
    }

  }
}
