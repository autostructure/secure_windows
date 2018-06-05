# This class manages V-26533
# The system must be configured to audit Account Management - Other Account Management Events successes.

class secure_windows::stig::v26533 (
  Boolean $enforced = true,
) {
  if $enforced {
    auditpol { 'Other Account Management Events':
      success => 'enable',
      failure => 'disable',
    }
  }
}
