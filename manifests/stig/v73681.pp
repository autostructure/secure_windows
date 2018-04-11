# V-73681
# NTLM must be prevented from falling back to a Null session.
class secure_windows::stig::v73681 (
  Boolean $enforced = false,
) {

  if $enforced {

    registry::value { 'v73681':
      key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0',
      value => 'allownullsessionfallback',
      type  => 'dword',
      data  => '0x00000000',
    }

  }

}
