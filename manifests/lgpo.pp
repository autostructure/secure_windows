# This class manages local group policy objects
#
# TODO:
# - Everything
#
class secure_windows::lgpo {

  # V-73309
  # Windows 2016 account lockout duration must be configured to 15 minutes or greater.
  local_security_policy { 'Account lockout duration':
    ensure         => 'present',
    policy_setting => 'LockoutDuration',
    policy_type    => 'System Access',
    policy_value   => '15',
  }

  # V-73311
  # The number of allowed bad logon attempts must be configured to three or less.
  local_security_policy { 'Account lockout threshold':
    ensure         => 'present',
    policy_setting => 'LockoutBadCount',
    policy_type    => 'System Access',
    policy_value   => '3',
  }

  # V-73313
  # The period of time before the bad logon counter is reset must be configured to 15 minutes or greater.
  local_security_policy { 'Reset account lockout counter after':
    ensure         => 'present',
    policy_setting => 'ResetLockoutCount',
    policy_type    => 'System Access',
    policy_value   => '15',
  }

  # V-73315
  # The password history must be configured to 24 passwords remembered.
  local_security_policy { 'Enforce password history':
    ensure         => 'present',
    policy_setting => 'PasswordHistorySize',
    policy_type    => 'System Access',
    policy_value   => '24',
  }

  # V-73317
  # The maximum password age must be configured to 60 days or less.
  local_security_policy { 'Maximum password age':
    ensure         => 'present',
    policy_setting => 'MaximumPasswordAge',
    policy_type    => 'System Access',
    policy_value   => '60',
  }

  # V-73319
  # The minimum password age must be configured to at least one day.
  local_security_policy { 'Minimum password age':
    ensure         => 'present',
    policy_setting => 'MinimumPasswordAge',
    policy_type    => 'System Access',
    policy_value   => '1',
  }

  # V-73321
  # The minimum password length must be configured to 14 characters.
  local_security_policy { 'Minimum password length':
    ensure         => 'present',
    policy_setting => 'MinimumPasswordLength',
    policy_type    => 'System Access',
    policy_value   => '14',
  }
}
