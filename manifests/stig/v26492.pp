# This class manages V-26492
# Unauthorized accounts must not have the Increase scheduling priority user right

class secure_windows::stig::v26492 (
  Boolean $enforced = true,
) {
  if $enforced {
    local_security_policy { 'Increase scheduling priority':
      ensure         => 'present',
      policy_setting => 'SeIncreaseBasePriorityPrivilege',
      policy_type    => 'Privilege Rights',
      policy_value   => '*S-1-5-32-544',
    }
  }
}
