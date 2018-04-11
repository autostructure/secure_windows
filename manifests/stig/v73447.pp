# This class manages:
# V-73447
# Windows Server 2016 must be configured to audit Logon/Logoff - Group Membership successes.
class secure_windows::stig::v73447 (
  Boolean $enforced = false,
) {
  if $enforced {
    auditpol { 'Group Membership':
      success => 'enable',
      failure => 'disable',
    }
  }
}
