#This class manages V-1107
#The password history must be configured to 24 passwords remembered.
class secure_windows::stig::v1107 (
  Boolean $enforced = true,
) {
  if $enforced {
    local_security_policy { 'Enforce password history':
      ensure         => 'present',
      policy_setting => 'PasswordHistorySize',
      policy_type    => 'System Access',
      policy_value   => '24',
    }
  }
}
