# This class manages V-26555
# The system must be configured to audit System - Security System Extension successes.

class secure_windows::stig::v26555 (
  Boolean $enforced = true,
) {
  if $enforced {
    auditpol { 'Security System Extension':
      success => 'enable',
      failure => 'disable',
    }
  }
}
