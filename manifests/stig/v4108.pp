# This class manages V-4108
# The system must generate an audit event when the audit log reaches a percentage of full threshold.
class secure_windows::stig::v4108 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v4108':
      key   => 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Eventlog\Security',
      value => 'WarningLevel',
      type  => 'dword',
      data  => '90',
    }
  }
}
