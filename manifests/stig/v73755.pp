# This class manages:
# V-73755
# The Debug programs user right must only be assigned to the Administrators group.
class secure_windows::stig::v73755 (
  Boolean $enforced = false,
) {
  if $enforced {
    local_security_policy { 'Debug programs':
      ensure         => 'present',
      policy_setting => 'SeDebugPrivilege',
      policy_type    => 'Privilege Rights',
      policy_value   => '*S-1-5-32-544',
    }
  }
}
