# This class manages:
# V-73449
# Windows Server 2016 must be configured to audit Logon/Logoff - Logoff successes.
class secure_windows::stig::v73449 (
  Boolean $enforced = false,
) {
  if $enforced {
    auditpol { 'Logoff':
      success => 'enable',
      failure => 'disable',
    }
  }
}
