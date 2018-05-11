# This class manages V-36667
# The system must be configured to audit Object Access - Removable Storage failures.
# This class manages V-36668
# The system must be configured to audit Object Access - Removable Storage successes.
class secure_windows::stig::v36667 (
  Boolean $enforced = true,
) {
  if $enforced {
    auditpol { 'Removable Storage':
      success => 'enable',
      failure => 'enable',
    }
  }
}
