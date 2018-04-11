# This class manages:
# V-73745
# The Create a pagefile user right must only be assigned to the Administrators group.
class secure_windows::stig::v73745 (
  Boolean $enforced = false,
) {
  if $enforced {
    local_security_policy { 'Create a pagefile':
      ensure         => 'present',
      policy_setting => 'SeCreatePagefilePrivilege',
      policy_type    => 'Privilege Rights',
      policy_value   => '*S-1-5-32-544',
    }
  }
}
