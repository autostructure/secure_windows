# This class manages V-26529
# The system must be configured to audit Account Logon - Credential Validation successes.
# Also manages V-26530
# The system must be configured to audit Account Logon - Credential Validation failures.


class secure_windows::stig::v26529 (
  Boolean $enforced = true,
) {
  if $enforced {
    auditpol { 'Credential Validation':
      success => 'enable',
      failure => 'enable',
    }
  }
}
