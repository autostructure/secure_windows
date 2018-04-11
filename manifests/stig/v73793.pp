# This class manages:
# V-73793
# The Manage auditing and security log user right must only be assigned to the Administrators group.
class secure_windows::stig::v73793 (
  Boolean $enforced = false,
) {
  if $enforced {
    local_security_policy { 'Manage auditing and security log':
      ensure         => 'present',
      policy_setting => 'SeSecurityPrivilege',
      policy_type    => 'Privilege Rights',
      policy_value   => '*S-1-5-32-544',
    }
  }
}
