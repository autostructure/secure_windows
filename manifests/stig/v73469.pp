# This class manages:
# V-73469
# Windows Server 2016 must be configured to audit Privilege Use - Sensitive Privilege Use successes.
# V-73471
# Windows Server 2016 must be configured to audit Privilege Use - Sensitive Privilege Use failures.
class secure_windows::stig::v73469 (
  Boolean $enforced = false,
) {
  if $enforced {
    auditpol { 'Sensitive Privilege Use':
      success => 'enable',
      failure => 'enable',
    }
  }
}
