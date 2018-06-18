# This class manages V-3378
# The system must be configured to use the Classic security model.

class secure_windows::stig::v3378 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v3378':
      key   => 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa',
      value => 'ForceGuest',
      type  => 'dword',
      data  => '0',
    }

  }
}
