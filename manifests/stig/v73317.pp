# This class manages:
# V-73317
# v73317 also covers v73223
# The maximum password age must be configured to 60 days or less.
class secure_windows::stig::v73317 (
  Boolean $enforced = false,
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
