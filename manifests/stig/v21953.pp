# This class manages V-21953
# PKU2U authentication using online identities must be prevented.
class secure_windows::stig::v21953 (
  Boolean $enforced = true,
) {

  if $enforced {

    registry_value { 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\LSA\pku2u\AllowOnlineID':
      ensure => present,
      type   => 'dword',
      data   => '0',
      }
    }
  }
