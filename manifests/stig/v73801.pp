# This class manages:
# V-73801
# The Restore files and directories user right must only be assigned to the Administrators group.
class secure_windows::stig::v73801 (
  Boolean $enforced = false,
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
