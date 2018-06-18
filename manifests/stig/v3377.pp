# This class manages V-3377
# The system must be configured to prevent anonymous users from having the same rights as the Everyone group.

class secure_windows::stig::v3377 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v3377':
      key   => 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa',
      value => 'EveryoneIncludesAnonymous',
      type  => 'dword',
      data  => '0',
    }

  }
}
