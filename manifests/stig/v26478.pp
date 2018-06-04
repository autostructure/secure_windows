# This class manages V-26478
# Unauthorized accounts must not have the Create a pagefile user right.

class secure_windows::stig::v26478 (
  Boolean $enforced = true,
) {
  if $enforced {
    local_security_policy { 'Create a pagefile':
      ensure         => 'present',
      policy_setting => 'SeCreatePagefilePrivilege',
      policy_type    => 'Privilege Rights',
      policy_value   => '*S-1-5-32-544',
    }
  }
}
