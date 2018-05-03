# V-73679
# Services using Local System that use Negotiate when reverting to NTLM authentication must use the
# computer identity instead of authenticating anonymously.
class secure_windows::stig::v73679 (
  Boolean $enforced = false,
) {

  if $enforced {

    registry::value { 'v73679':
      key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa',
      value => 'UseMachineId',
      type  => 'dword',
      data  => '0x00000001',
    }

  }

}
