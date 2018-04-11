# This class manages:
# V-73809
# The built-in guest account must be disabled.
class secure_windows::stig::v73809 (
  Boolean $enforced = false,
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
