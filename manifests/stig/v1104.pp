#This class manages V-1104
#The maximum password age must meet requirements.
class secure_windows::stig::v1104 (
  Boolean $enforced = true,
) {
  if $enforced {
    local_security_policy { 'Maximum password age':
      ensure         => 'present',
      policy_setting => 'MaximumPasswordAge',
      policy_type    => 'System Access',
      policy_value   => '60',
    }
  }
}
