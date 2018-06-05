# This class manages:
# V-73427
# Windows Server 2016 must be configured to audit Account Management - User Account Management successes.
# V-73429
# Windows Server 2016 must be configured to audit Account Management - User Account Management failures.
class secure_windows::stig::v73427 (
  Boolean $enforced = false,
) {
  if $enforced {
    auditpol { 'User Account Management':
      success => 'enable',
      failure => 'enable',
    }
  }
}
