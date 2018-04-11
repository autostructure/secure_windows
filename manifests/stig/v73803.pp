# This class manages:
# V-73803
# The Take ownership of files or other objects user right must only be assigned to the Administrators group.
class secure_windows::stig::v73803 (
  Boolean $enforced = false,
) {
  if $enforced {
    local_security_policy { 'Take ownership of files or other objects':
      ensure         => 'present',
      policy_setting => 'SeTakeOwnershipPrivilege',
      policy_type    => 'Privilege Rights',
      policy_value   => '*S-1-5-32-544',
    }
  }
}
