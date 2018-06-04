# This class manages V-26472
# Unauthorized accounts must not have the Allow log on locally user right.

class secure_windows::stig::v26472 (
  Boolean $enforced = true,
) {
  if $enforced {
    local_security_policy { 'Allow log on locally':
      ensure         => 'present',
      policy_setting => 'SeInteractiveLogonRight',
      policy_type    => 'Privilege Rights',
      policy_value   => '*S-1-5-32-544',
    }
  }
}
