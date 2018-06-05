# This class manages V-26504
# Unauthorized accounts must not have the Restore files and directories user right.

class secure_windows::stig::v26504 (
  Boolean $enforced = true,
) {
  if $enforced {
    local_security_policy { 'Restore files and directories':
      ensure         => 'present',
      policy_setting => 'SeRestorePrivilege',
      policy_type    => 'Privilege Rights',
      policy_value   => '*S-1-5-32-544',
    }
  }
}
