# V-73667
# Anonymous enumeration of Security Account Manager (SAM) accounts must not be allowed.
class secure_windows::stig::v73667 (
  Boolean $enforced = false,
) {

  if $enforced {

    registry::value { 'v73667':
      key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa',
      value => 'RestrictAnonymousSAM',
      type  => 'dword',
      data  => '0x00000001',
    }

  }

}
