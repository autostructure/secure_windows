# This class manages V-6836
# Passwords must, at a minimum, be 14 characters.
class secure_windows::stig::v6836 (
  Boolean $enforced = true,
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
