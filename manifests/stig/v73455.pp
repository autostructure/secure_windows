# This class manages:
# V-73455
# Windows Server 2016 must be configured to audit Logon/Logoff - Special Logon successes.
class secure_windows::stig::v73455 (
  Boolean $enforced = false,
) {
  if $enforced {
    auditpol { 'Special Logon':
      success => 'enable',
      failure => 'disable',
    }
  }
}
