#This class manages V-1105
#The minimum password age must meet requirements.
class secure_windows::stig::v1105 (
  Boolean $enforced = true,
) {
  if $enforced {
    local_security_policy { 'Minimum password age':
      ensure         => 'present',
      policy_setting => 'MinimumPasswordAge',
      policy_type    => 'System Access',
      policy_value   => '1',
    }

  }
}
