# This class manages V-26557
# The system must be configured to audit System - System Integrity successes.
# This class also manages V-26558
# The system must be configured to audit System - System Integrity failures.

class secure_windows::stig::v26557 (
  Boolean $enforced = true,
) {
  if $enforced {
    auditpol { 'System Integrity':
      success => 'enable',
      failure => 'enable',
    }
  }
}
