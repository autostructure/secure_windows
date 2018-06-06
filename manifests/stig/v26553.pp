# This class manages V-26553
# The system must be configured to audit System - Security State Change successes.

class secure_windows::stig::v26553 (
  Boolean $enforced = true,
) {
  if $enforced {
    auditpol { 'Security State Change':
      success => 'enable',
      failure => 'disable',
    }
  }
}
