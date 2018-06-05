# This class manages V-26498
# Unauthorized accounts must not have the Modify firmware environment values user right.

class secure_windows::stig::v26498 (
  Boolean $enforced = true,
) {
  if $enforced {
    local_security_policy { 'Modify firmware environment values':
      ensure         => 'present',
      policy_setting => 'SeSystemEnvironmentPrivilege',
      policy_type    => 'Privilege Rights',
      policy_value   => '*S-1-5-32-544',
    }
  }
}
