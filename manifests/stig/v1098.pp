# This class manages V-1098
# The reset period for the account lockout counter must be configured to 15 minutes or greater on Windows 2012.
class secure_windows::stig::v1098 (
  Boolean $enforced = true,
) {
  if $enforced {
    local_security_policy { 'Reset account lockout counter after':
      ensure         => 'present',
      policy_setting => 'ResetLockoutCount',
      policy_type    => 'System Access',
      policy_value   => '15',
    }

  }


}
