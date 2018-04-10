# This class manages:
# V-73795
# The Modify firmware environment values user right must only be assigned to the Administrators group.
class secure_windows::stig::v73795 (
  Boolean $enforced = false,
) {
  if $enforced {
    local_security_policy { 'Modify firmware environment values':
      ensure         => 'present',
      policy_setting => 'SeSystemEnvironmentPrivilege',
      policy_type    => 'Privilege Rights',
      policy_value   => '*S-1-5-32-544',
    }
  }
}
