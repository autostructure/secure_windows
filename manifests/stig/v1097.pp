# This class manages V-1097
# The number of allowed bad logon attempts must meet minimum requirements.
class secure_windows::stig::v1097 (
  Boolean $enforced = true,
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
