# This class manages:
# V-73743
# The Back up files and directories user right must only be assigned to the Administrators group.
class secure_windows::stig::v73743 (
  Boolean $enforced = false,
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
