# This class manages:
# V-73431
# Windows Server 2016 must be configured to audit Detailed Tracking - Plug and Play Events successes.
class secure_windows::stig::v73431 (
  Boolean $enforced = false,
) {
  if $enforced {
    auditpol { 'Plug and Play Events':
      success => 'enable',
      failure => 'disable',
    }
  }
}
