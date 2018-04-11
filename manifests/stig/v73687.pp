# V-73687
# Windows Server 2016 must be configured to prevent the storage of the LAN Manager hash of passwords.
class secure_windows::stig::v73687 (
  Boolean $enforced = false,
) {

  if $enforced {

    registry::value { 'v73687':
      key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa',
      value => 'NoLMHash',
      type  => 'dword',
      data  => '0x00000001',
    }

  }

}
