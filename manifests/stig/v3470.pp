# This class manages V-3470
# The system must be configured to prevent unsolicited remote assistance offers.
class secure_windows::stig::v3470 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v3470':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Terminal Services',
      value => 'fAllowUnsolicited',
      type  => 'dword',
      data  => '0',
    }
  }
}
