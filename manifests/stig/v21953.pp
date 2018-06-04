# This class manages V-21953
# PKU2U authentication using online identities must be prevented.
class secure_windows::stig::v21953 (
  Boolean $enforced = true,
) {

  if $enforced {
    registry::value { 'v21953':
      key   => 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\LSA\pku2u\AllowOnlineID',
      value => 'AllowOnlineID',
      type  => 'dword',
      data  => '0',
    }
  }
}
