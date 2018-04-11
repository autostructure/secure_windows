# This class manages:
# V-73319
# The minimum password age must be configured to at least one day.
class secure_windows::stig::v73319 (
  Boolean $enforced = false,
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
