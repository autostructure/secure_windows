# This class manages V-26503
# Unauthorized accounts must not have the Replace a process level token user right.

class secure_windows::stig::v26503 (
  Boolean $enforced = true,
) {
  if $enforced {
    local_security_policy { 'Replace a process level token':
      ensure         => 'present',
      policy_setting => 'SeAssignPrimaryTokenPrivilege',
      policy_type    => 'Privilege Rights',
      policy_value   => '*S-1-5-19,*S-1-5-20',
    }
  }
}
