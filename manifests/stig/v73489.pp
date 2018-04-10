# This class manages:
# V-73489
# Windows Server 2016 must be configured to audit System - System Integrity successes.
# V-73491
# Windows Server 2016 must be configured to audit System - System Integrity failures.
class secure_windows::stig::v73489 (
  Boolean $enforced = false,
) {
  if $enforced {
    auditpol { 'System Integrity':
      success => 'enable',
      failure => 'enable',
    }
  }
}
