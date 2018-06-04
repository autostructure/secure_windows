# This class manages V-26493
# Unauthorized accounts must not have the Load and unload device drivers user right.

class secure_windows::stig::v26493 (
  Boolean $enforced = true,
) {
  if $enforced {
    local_security_policy { 'Load and unload device drivers':
      ensure         => 'present',
      policy_setting => 'SeLoadDriverPrivilege',
      policy_type    => 'Privilege Rights',
      policy_value   => '*S-1-5-32-544',
    }
  }
}
