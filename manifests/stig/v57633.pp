# This class manages V-57633
# The system must be configured to audit Policy Change - Authorization Policy Change successes.
class secure_windows::stig::v57633 (
  Boolean $enforced = true,
) {
  if $enforced {
    auditpol { 'Authorization Policy Change':
      success => 'enable',
      failure => 'disable',
    }
  }
}
