# This class manages:
# V-73323
# The built-in Windows password complexity policy must be enabled.
class secure_windows::stig::v73323 (
  Boolean $enforced = false,
) {
  if $enforced {
    local_security_policy { 'Password must meet complexity requirements':
      ensure         => 'present',
      policy_setting => 'PasswordComplexity',
      policy_type    => 'System Access',
      policy_value   => '1',
    }
  }
}
