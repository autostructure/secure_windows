#This class manages V-18010
#Unauthorized accounts must not have the Debug programs user right.
class secure_windows::stig::v18010 (
  Boolean $enforced = true,
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
