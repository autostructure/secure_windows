# This class manages V-78061
# Windows Server 2012/2012 R2 must be configured to audit System - Other System Events successes.
# This class manages V-78063
# Windows Server 2012/2012 R2 must be configured to audit System - Other System Events failures.
class secure_windows::stig::v78061 (
  Boolean $enforced = true,
) {
  if $enforced {
    auditpol { 'Other System Events':
      success => 'enable',
      failure => 'enable',
    }
  }
}
