# V-73525
# Group Policy objects must be reprocessed even if they have not changed.
class secure_windows::stig::v73525 (
  Boolean $enforced = false,
) {

  if $enforced {

    registry::value { 'v73525':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}',
      value => 'NoGPOListChanges',
      type  => 'dword',
      data  => '0x00000000',
    }

  }

}
