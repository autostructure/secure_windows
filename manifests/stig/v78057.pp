# This class manages V-78057
# Windows Server 2012/2012 R2 must be configured to audit Logon/Logoff - Account Lockout successes.
# This class manages V-78059
# Windows Server 2012/2012 R2 must be configured to audit Logon/Logoff - Account Lockout failures.
class secure_windows::stig::v78057 (
  Boolean $enforced = false,
) {
  if $enforced {
    auditpol { 'Logon':
      success => 'enable',
      failure => 'enable',
    }
  }
}
