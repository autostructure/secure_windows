# V-73671
# Windows Server 2016 must be configured to prevent the storage of passwords and credentials.
class secure_windows::stig::v73671 (
  Boolean $enforced = false,
) {

  if $enforced {

    registry::value { 'v73671':
      key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa',
      value => 'DisableDomainCreds',
      type  => 'dword',
      data  => '0x00000001',
    }

  }

}
