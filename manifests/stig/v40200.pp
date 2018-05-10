# This class manages V-40200
# The system must be configured to audit Object Access - Central Access Policy Staging failures.
# This class manages V-40202
# The system must be configured to audit Object Access - Central Access Policy Staging successes.
class secure_windows::stig::v40200 (
  Boolean $enforced = true,
) {
  if $enforced {
    auditpol { 'Central Policy Staging':
      failure => 'enable',
      success => 'enable',
    }
  }
}
