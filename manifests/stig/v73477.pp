# This class manages:
# V-73477
# Windows Server 2016 must be configured to audit System - Other System Events successes.
# V-73479
# Windows Server 2016 must be configured to audit System - Other System Events failures.
class secure_windows::stig::v73477 (
  Boolean $enforced = false,
) {
  if $enforced {
    auditpol { 'Other System Events':
      success => 'enable',
      failure => 'enable',
    }
  }
}
