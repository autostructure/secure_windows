# This class manages V-21951
# Services using Local System that use Negotiate when reverting to NTLM authentication must use the
# computer identity vs. authenticating anonymously.
class secure_windows::stig::v21951 (
  Boolean $enforced = true,
) {

  if $enforced {

    registry::value { 'v21951':
      key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa',
      value => 'UseMachineId',
      type  => 'dword',
      data  => '0x00000001',
    }

  }

}
