# V-73705
# The default permissions of global system objects must be strengthened.
class secure_windows::stig::v73705 (
  Boolean $enforced = false,
) {

  if $enforced {

    registry::value { 'v73705':
      key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager',
      value => 'ProtectionMode',
      type  => 'dword',
      data  => '0x00000001',
    }

  }

}
