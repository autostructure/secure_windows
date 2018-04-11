# V-73669
# Anonymous enumeration of shares must not be allowed.
class secure_windows::stig::v73669 (
  Boolean $enforced = false,
) {

  if $enforced {

    registry::value { 'v73669':
      key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa',
      value => 'RestrictAnonymous',
      type  => 'dword',
      data  => '0x00000001',
    }

  }

}
