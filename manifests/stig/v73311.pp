# This class manages:
# V-73311
# The number of allowed bad logon attempts must be configured to three or less.
class secure_windows::stig::v73311 (
  Boolean $enforced = false,
) {
  if $enforced {
    local_security_policy { 'Account lockout threshold':
      ensure         => 'present',
      policy_setting => 'LockoutBadCount',
      policy_type    => 'System Access',
      policy_value   => '3',
    }
  }
}
