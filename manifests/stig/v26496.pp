# This class manages V-26496
# Unauthorized accounts must not have the Manage auditing and security log user right.

class secure_windows::stig::v26496 (
  Boolean $enforced = true,
) {
  if $enforced {
    local_security_policy { 'Manage auditing and security log':
      ensure         => 'present',
      policy_setting => 'SeSecurityPrivilege',
      policy_type    => 'Privilege Rights',
      policy_value   => '*S-1-5-32-544',
    }
  }
}
