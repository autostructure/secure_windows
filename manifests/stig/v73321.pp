# This class manages:
# V-73321
# The minimum password length must be configured to 14 characters.
class secure_windows::stig::v73321 (
  Boolean $enforced = false,
) {
  if $enforced {
    local_security_policy { 'Minimum password length':
      ensure         => 'present',
      policy_setting => 'MinimumPasswordLength',
      policy_type    => 'System Access',
      policy_value   => '14',
    }
  }
}
