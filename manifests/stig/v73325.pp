# This class manages:
# V-73325
# Reversible password encryption must be disabled.
class secure_windows::stig::v73325 (
  Boolean $enforced = false,
) {
  if $enforced {
    local_security_policy { 'Store passwords using reversible encryption':
      ensure         => 'present',
      policy_setting => 'ClearTextPassword',
      policy_type    => 'System Access',
      policy_value   => '0',
    }
  }
}
