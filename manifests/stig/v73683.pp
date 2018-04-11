# V-73683
# PKU2U authentication using online identities must be prevented.
class secure_windows::stig::v73683 (
  Boolean $enforced = false,
) {

  if $enforced {

    registry::value { 'v73683':
      key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa\pku2u',
      value => 'AllowOnlineID',
      type  => 'dword',
      data  => '0x00000000',
    }

  }

}
