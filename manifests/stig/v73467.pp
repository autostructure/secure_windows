# This class manages:
# V-73467
# Windows Server 2016 must be configured to audit Policy Change - Authorization Policy Change successes.
class secure_windows::stig::v73467 (
  Boolean $enforced = false,
) {
  if $enforced {
    auditpol { 'Authorization Policy Change':
      success => 'enable',
      failure => 'disable',
    }
  }
}
