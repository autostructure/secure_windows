#This class manages V-1113
#The built-in guest account must be disabled.
class secure_windows::stig::v1113 (
  Boolean $enforced = true,
) {
  if $enforced {
    local_security_policy { 'EnableGuestAccount':
      ensure         => 'present',
      policy_setting => 'EnableGuestAccount',
      policy_type    => 'System Access',
      policy_value   => '0',
    }
  }
}
