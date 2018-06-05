# This class manages V-26535
# The system must be configured to audit Account Management - Security Group Management successes.

class secure_windows::stig::v26535 (
  Boolean $enforced = true,
) {
  if $enforced {
    auditpol { 'Security Group Management':
      success => 'enable',
      failure => 'disable',
    }
  }
}
