# This class manages V-26537
# The system must be configured to audit Account Management - User Account Management successes.
# This also covers V-26538
# The system must be configured to audit Account Management - User Account Management failures.

class secure_windows::stig::v26537 (
  Boolean $enforced = true,
) {
  if $enforced {
    auditpol { 'User Account Management':
      success => 'enable',
      failure => 'enable',
    }
  }
}
