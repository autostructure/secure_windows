#This class manages V-1173
#The default permissions of global system objects must be increased.
class secure_windows::stig::v1173 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v1173':
      key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager',
      value => 'ProtectionMode',
      type  => 'dword',
      data  => '0x00000001',
    }

  }
}
