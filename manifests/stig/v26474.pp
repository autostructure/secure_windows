# This class manages V-26474
# Unauthorized accounts must not have the back up files and directories user right.

class secure_windows::stig::v26474 (
  Boolean $enforced = true,
) {
  if $enforced {
    local_security_policy { 'Back up files and directories':
      ensure         => 'present',
      policy_setting => 'SeBackupPrivilege',
      policy_type    => 'Privilege Rights',
      policy_value   => '*S-1-5-32-544',

    }
  }
}
