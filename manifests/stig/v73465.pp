# This class manages:
# V-73465
# Windows Server 2016 must be configured to audit Policy Change - Authentication Policy Change successes.
class secure_windows::stig::v73465 (
  Boolean $enforced = false,
) {
  if $enforced {
    auditpol { 'Authentication Policy Change':
      success => 'enable',
      failure => 'disable',
    }
  }
}
