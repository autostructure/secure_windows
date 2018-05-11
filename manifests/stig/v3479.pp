# This class manages V-3479
# The system must be configured to use Safe DLL Search Mode.
class secure_windows::stig::v3479 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v3479':
      key   => 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager',
      value => 'SafeDllSearchMode',
      type  => 'dword',
      data  => '1',
    }
  }
}
