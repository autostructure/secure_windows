# This class manages V-21952
# NTLM must be prevented from falling back to a Null session.
class secure_windows::stig::v21952 (
  Boolean $enforced = true,
) {

  if $enforced {

    registry_value { 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\LSA\MSV1_0\allownullsessionfallback':
      ensure => present,
      type   => 'dword',
      data   => '0',
      }
    }
  }
