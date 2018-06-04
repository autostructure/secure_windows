# This class manages V-26480
# Unauthorized accounts must not have the Create global objects user right.

class secure_windows::stig::v26480 (
  Boolean $enforced = true,
) {
  if $enforced {
    local_security_policy { 'Create global objects':
      ensure         => 'present',
      policy_setting => 'SeCreateGlobalPrivilege',
      policy_type    => 'Privilege Rights',
      policy_value   => '*S-1-5-19,*S-1-5-20,*S-1-5-32-544,*S-1-5-6',
    }
  }
}
