# This class manages:
# V-73423
# Windows Server 2016 must be configured to audit Account Management - Security Group Management successes.
# V-73425
# Windows Server 2016 must be configured to audit Account Management - Security Group Management failures.
class secure_windows::stig::v73423 (
  Boolean $enforced = false,
) {
  if $enforced {
    auditpol { 'Security Group Management':
      success => 'enable',
      failure => 'enable',
    }
  }
}
