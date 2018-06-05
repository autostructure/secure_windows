# This class manages V-26543
# The system must be configured to audit Logon/Logoff - Special Logon successes.

class secure_windows::stig::v26543 (
  Boolean $enforced = true,
) {
  if $enforced {
    auditpol { 'Special Logon':
      success => 'enable',
      failure => 'disable',
    }
  }
}
