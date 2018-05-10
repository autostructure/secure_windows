# This class manages V-1099
#Windows 2012 account lockout duration must be configured to 15 minutes or greater.
class secure_windows::stig::v1099 (
  Boolean $enforced = true,
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
