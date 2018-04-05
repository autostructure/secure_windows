# V-73309
# Windows 2016 account lockout duration must be configured to 15 minutes or greater.
class secure_windows::stig::v73309 (
  Boolean $enforced = false,
) {
  if $enforced {
    local_security_policy { 'Account lockout duration':
      ensure         => 'present',
      policy_setting => 'LockoutDuration',
      policy_type    => 'System Access',
      policy_value   => '15',
    }
  }
}
