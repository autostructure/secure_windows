# This class manages:
# V-73413
# Windows Server 2016 must be configured to audit Account Logon - Credential Validation successes.
# V-73415
# Windows Server 2016 must be configured to audit Account Logon - Credential Validation failures.
class secure_windows::stig::v73413 (
  Boolean $enforced = false,
) {
  if $enforced {
    auditpol { 'Credential Validation':
      success => 'enable',
      failure => 'enable',
    }
  }
}
