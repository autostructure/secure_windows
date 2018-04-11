# This class manages:
# V-73483
# Windows Server 2016 must be configured to audit System - Security System Extension successes.
# V-73485
# Windows Server 2016 must be configured to audit System - Security System Extension failures.
class secure_windows::stig::v73483 (
  Boolean $enforced = false,
) {
  if $enforced {
    auditpol { 'Security System Extension':
      success => 'enable',
      failure => 'enable',
    }
  }
}
