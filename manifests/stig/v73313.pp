# This class manages:
# V-73313
# The period of time before the bad logon counter is reset must be configured to 15 minutes or greater.
class secure_windows::stig::v73313 (
  Boolean $enforced = false,
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
