# This class manages V-26541
# The system must be configured to audit Logon/Logoff - Logon successes.
# This also manages V-26542
# The system must be configured to audit Logon/Logoff - Logon failures.

class secure_windows::stig::v26541 (
  Boolean $enforced = true,
) {
  if $enforced {
    auditpol { 'Logon':
      success => 'enable',
      failure => 'enable',
    }
  }
}
