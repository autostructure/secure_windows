# This class manages:
# V-73419
# Windows Server 2016 must be configured to audit Account Management - Other Account Management Events successes.
# V-73421
# Windows Server 2016 must be configured to audit Account Management - Other Account Management Events failures.
class secure_windows::stig::v73419 (
  Boolean $enforced = false,
) {
  if $enforced {
    auditpol { 'Other Account Management Events':
      success => 'enable',
      failure => 'enable',
    }
  }
}
