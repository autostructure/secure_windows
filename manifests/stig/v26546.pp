# This class manages V-26546
# The system must be configured to audit Policy Change - Audit Policy Change successes.
# This also manages V-26547
# The system must be configured to audit Policy Change - Audit Policy Change failures.

class secure_windows::stig::v26546 (
  Boolean $enforced = true,
) {
  if $enforced {
    auditpol { 'Audit Policy Change':
      success => 'enable',
      failure => 'enable',
    }
  }
}
