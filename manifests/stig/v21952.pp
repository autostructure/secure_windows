# This class manages V-21952
# NTLM must be prevented from falling back to a Null session.
class secure_windows::stig::v21952 (
  Boolean $enforced = true,
) {

  if $enforced {

    registry::value { 'v21952':
      key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0',
      value => 'allownullsessionfallback',
      type  => 'dword',
      data  => '0x00000000',
    }

  }

}
