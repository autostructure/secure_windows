# This class manages V-26549
# The system must be configured to audit Privilege Use - Sensitive Privilege Use successes.
# This also manages V-26550
# The system must be configured to audit Privilege Use - Sensitive Privilege Use failures.

class secure_windows::stig::v26549 (
  Boolean $enforced = true,
) {
  if $enforced {
    auditpol { 'Sensitive Privilege Use':
      success => 'enable',
      failure => 'enable',
    }
  }
}
