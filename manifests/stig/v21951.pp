# This class manages V-21951
# Services using Local System that use Negotiate when reverting to NTLM authentication must use the
# computer identity vs. authenticating anonymously.
class secure_windows::stig::v21951 (
  Boolean $enforced = true,
) {

  if $enforced {

    registry_value { 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\LSA\UseMachineId':
      ensure => present,
      type   => 'dword',
      data   => '1',
      }
    }
  }
