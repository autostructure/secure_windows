# V-73673
# Windows Server 2016 must be configured to prevent anonymous users from having the same permissions as the Everyone group.
class secure_windows::stig::v73673 (
  Boolean $enforced = false,
) {

  if $enforced {

    registry::value { 'v73673':
      key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa',
      value => 'EveryoneIncludesAnonymous',
      type  => 'dword',
      data  => '0x00000000',
    }

  }

}
