# This class manages:
# V-73433
# Windows Server 2016 must be configured to audit Detailed Tracking - Process Creation successes.
class secure_windows::stig::v73433 (
  Boolean $enforced = false,
) {
  if $enforced {
    auditpol { 'Process Creation':
      success => 'enable',
      failure => 'disable',
    }
  }
}
