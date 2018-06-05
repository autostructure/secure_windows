# This class manages V-26500
# Unauthorized accounts must not have the Profile single process user right.

class secure_windows::stig::v26500 (
  Boolean $enforced = true,
) {
  if $enforced {
    local_security_policy { 'Profile single process':
      ensure         => 'present',
      policy_setting => 'SeProfileSingleProcessPrivilege',
      policy_type    => 'Privilege Rights',
      policy_value   => '*S-1-5-32-544',
    }
  }
}
