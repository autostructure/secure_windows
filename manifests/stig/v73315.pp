# This class manages:
# V-73315
# The password history must be configured to 24 passwords remembered.
class secure_windows::stig::v73315 (
  Boolean $enforced = false,
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
