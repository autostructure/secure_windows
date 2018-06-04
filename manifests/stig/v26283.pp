# This class manages V-26283
# Anonymous enumeration of SAM accounts must not be allowed.
class secure_windows::stig::v26283 (
  Boolean $enforced = true,
  ) {
    if $enforced {

      registry::value { 'v26283':
        key   => 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa',
        value => 'RestrictAnonymousSAM',
        type  => 'dword',
        data  => '1',
      }

    }

  }
