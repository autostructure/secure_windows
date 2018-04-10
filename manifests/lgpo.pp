#docs
class secure_windows::lgpo {

  # V-73781
  # The Force shutdown from a remote system user right must only be assigned to the Administrators group.
  local_security_policy { 'Force shutdown from a remote system':
    ensure         => 'present',
    policy_setting => 'SeRemoteShutdownPrivilege',
    policy_type    => 'Privilege Rights',
    policy_value   => '*S-1-5-32-544',
  }

  # V-73783
  # The Generate security audits user right must only be assigned to Local Service and Network Service.
  local_security_policy { 'Generate security audits':
    ensure         => 'present',
    policy_setting => 'SeAuditPrivilege',
    policy_type    => 'Privilege Rights',
    policy_value   => '*S-1-5-19,*S-1-5-20',
  }

  # V-73785
  # The Impersonate a client after authentication user right must only be assigned to Administrators, Service, Local Service, and Network
  # Service.
  local_security_policy { 'Impersonate a client after authentication':
    ensure         => 'present',
    policy_setting => 'SeImpersonatePrivilege',
    policy_type    => 'Privilege Rights',
    policy_value   => '*S-1-5-19,*S-1-5-20,*S-1-5-32-544,*S-1-5-6',
  }

  # V-73787
  # The Increase scheduling priority user right must only be assigned to the Administrators group.
  local_security_policy { 'Increase scheduling priority':
    ensure         => 'present',
    policy_setting => 'SeIncreaseBasePriorityPrivilege',
    policy_type    => 'Privilege Rights',
    policy_value   => '*S-1-5-32-544',
  }

  # V-73789
  # The Load and unload device drivers user right must only be assigned to the Administrators group.
  local_security_policy { 'Load and unload device drivers':
    ensure         => 'present',
    policy_setting => 'SeLoadDriverPrivilege',
    policy_type    => 'Privilege Rights',
    policy_value   => '*S-1-5-32-544',
  }

  # V-73791
  # The Lock pages in memory user right must not be assigned to any groups or accounts.
  local_security_policy { 'Lock pages in memory':
    ensure         => 'absent',
  }

  # V-73793
  # The Manage auditing and security log user right must only be assigned to the Administrators group.
  local_security_policy { 'Manage auditing and security log':
    ensure         => 'present',
    policy_setting => 'SeSecurityPrivilege',
    policy_type    => 'Privilege Rights',
    policy_value   => '*S-1-5-32-544',
  }

  # V-73795
  # The Modify firmware environment values user right must only be assigned to the Administrators group.
  local_security_policy { 'Modify firmware environment values':
    ensure         => 'present',
    policy_setting => 'SeSystemEnvironmentPrivilege',
    policy_type    => 'Privilege Rights',
    policy_value   => '*S-1-5-32-544',
  }

  # V-73797
  # The Perform volume maintenance tasks user right must only be assigned to the Administrators group.
  local_security_policy { 'Perform volume maintenance tasks':
    ensure         => 'present',
    policy_setting => 'SeManageVolumePrivilege',
    policy_type    => 'Privilege Rights',
    policy_value   => '*S-1-5-32-544',
  }

  # V-73799
  # The Profile single process user right must only be assigned to the Administrators group.
  local_security_policy { 'Profile single process':
    ensure         => 'present',
    policy_setting => 'SeProfileSingleProcessPrivilege',
    policy_type    => 'Privilege Rights',
    policy_value   => '*S-1-5-32-544',
  }

  # V-73801
  # The Restore files and directories user right must only be assigned to the Administrators group.
  local_security_policy { 'Restore files and directories':
    ensure         => 'present',
    policy_setting => 'SeRestorePrivilege',
    policy_type    => 'Privilege Rights',
    policy_value   => '*S-1-5-32-544',
  }

  # V-73803
  # The Take ownership of files or other objects user right must only be assigned to the Administrators group.
  local_security_policy { 'Take ownership of files or other objects':
    ensure         => 'present',
    policy_setting => 'SeTakeOwnershipPrivilege',
    policy_type    => 'Privilege Rights',
    policy_value   => '*S-1-5-32-544',
  }

  # V-73809
  # The built-in guest account must be disabled.
  local_security_policy { 'EnableGuestAccount':
    ensure         => 'present',
    policy_setting => 'EnableGuestAccount',
    policy_type    => 'System Access',
    policy_value   => '0',
  }
}
