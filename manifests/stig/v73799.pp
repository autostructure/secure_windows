# This class manages:
# V-73799
# The Profile single process user right must only be assigned to the Administrators group.
class secure_windows::stig::v73799 (
  Boolean $enforced = false,
) {
  if $enforced {
    local_security_policy { 'Profile single process':
      ensure         => 'present',
      policy_setting => 'SeProfileSingleProcessPrivilege',
      policy_type    => 'Privilege Rights',
      policy_value   => '*S-1-5-32-544',
    }
  }
}
