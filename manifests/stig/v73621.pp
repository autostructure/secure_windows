# V-73621
# Local accounts with blank passwords must be restricted to prevent access from the network.
class secure_windows::stig::v73621 (
  Boolean $enforced = false,
) {

  if $enforced {

    registry::value { 'v73621':
      key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa',
      value => 'LimitBlankPasswordUse',
      type  => 'dword',
      data  => '0x00000001',
    }

  }

}
