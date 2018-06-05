# This class manages V-26539
# The system must be configured to audit Detailed Tracking - Process Creation successes.

class secure_windows::stig::v26539 (
  Boolean $enforced = true,
) {
  if $enforced {
    auditpol { 'Process Creation':
      success => 'enable',
      failure => 'disable',
    }
  }
}
