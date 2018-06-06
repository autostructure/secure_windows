# This class manages V-26551
# The system must be configured to audit System - IPsec Driver successes.
# This class also covers V-26552
# The system must be configured to audit System - IPsec Driver failures.

class secure_windows::stig::v26551 (
  Boolean $enforced = true,
) {
  if $enforced {
    auditpol { 'IPsec Driver':
      success => 'enable',
      failure => 'enable',
    }
  }
}
