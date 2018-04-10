# This class manages:
# V-73481
# Windows Server 2016 must be configured to audit System - Security State Change successes.
class secure_windows::stig::v73481 (
  Boolean $enforced = false,
) {
  if $enforced {
    auditpol { 'Security State Change':
      success => 'enable',
      failure => 'disable',
    }
  }
}
