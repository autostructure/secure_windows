# This class manages V-26540
# The system must be configured to audit Logon/Logoff - Logoff successes.

class secure_windows::stig::v26540 (
  Boolean $enforced = true,
) {
  if $enforced {
    auditpol { 'Logoff':
      success => 'enable',
      failure => 'disable',
    }
  }
}
