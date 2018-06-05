# This class manages V-26548
# The system must be configured to audit Policy Change - Authentication Policy Change successes.

class secure_windows::stig::v26548 (
  Boolean $enforced = true,
) {
  if $enforced {
    auditpol { 'Authentication Policy Change':
      success => 'enable',
      failure => 'disable',
    }
  }
}
