# This class manages V-26476
# Unauthorized accounts must not have the Change the system time user right.

class secure_windows::stig::v26476 (
  Boolean $enforced = true,
) {
  if $enforced {
    local_security_policy { 'Change the system time':
      ensure         => 'present',
      policy_setting => 'SeBackupPrivilege',
      policy_type    => 'Privilege Rights',
      policy_value   => '*S-1-5-32-544,*S-1-5-19',

    }
  }
}
