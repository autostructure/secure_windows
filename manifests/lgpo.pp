#
# This class manages local group policy objects with local_security_policy
#
# TODO:
# - Unit Tests
# - Member Server Network Access for Domain Servers
# - Kerberos stuff on Domain Controllers
#
class secure_windows::lgpo {

  # # V-73309
  # # Windows 2016 account lockout duration must be configured to 15 minutes or greater.
  # local_security_policy { 'Account lockout duration':
  #   ensure         => 'present',
  #   policy_setting => 'LockoutDuration',
  #   policy_type    => 'System Access',
  #   policy_value   => '15',
  # }

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

  # V-73323
  # The built-in Windows password complexity policy must be enabled.
  local_security_policy { 'Password must meet complexity requirements':
    ensure         => 'present',
    policy_setting => 'PasswordComplexity',
    policy_type    => 'System Access',
    policy_value   => '1',
  }

  # V-73325
  # Reversible password encryption must be disabled.
  local_security_policy { 'Store passwords using reversible encryption':
    ensure         => 'present',
    policy_setting => 'ClearTextPassword',
    policy_type    => 'System Access',
    policy_value   => '0',
  }

  # # V-73359
  # # Kerberos user logon restrictions must be enforced.
  #
  #
  # # V-73361
  # # The Kerberos service ticket maximum lifetime must be limited to 600 minutes or less.
  #
  #
  # # V-73363
  # # The Kerberos user ticket lifetime must be limited to 10 hours or less.
  #
  #
  # # V-73365
  # # The Kerberos policy user ticket renewal maximum lifetime must be limited to seven days or less.
  #
  #
  # # V-73367
  # # The computer clock synchronization tolerance must be limited to 5 minutes or less.
  #
  #
  # # V-73369
  # # Permissions on the Active Directory data files must only allow System and Administrators access.
  #

  # V-73623
  # The built-in administrator account must be renamed.
  local_security_policy { 'Accounts: Rename administrator account':
    ensure         => 'present',
    policy_setting => 'NewAdministratorName',
    policy_type    => 'System Access',
    policy_value   => '"adminaccount"',
  }

  # V-73625
  # The built-in guest account must be renamed.
  local_security_policy { 'Accounts: Rename guest account':
    ensure         => 'present',
    policy_setting => 'NewGuestName',
    policy_type    => 'System Access',
    policy_value   => '"guestaccount"',
  }

  # # V-73665
  # # Anonymous SID/Name translation must not be allowed.
  # local_security_policy { 'Network access: Allow anonymous SID/name translation':
  #   ensure         => 'present',
  #   policy_setting => 'LSAAnonymousNameLookup',
  #   policy_type    => 'System Access',
  #   policy_value   => '0',
  # }
  #
  # # V-73689
  # # Windows Server 2016 must be configured to force users to log off when their allowed logon hours expire.
  # local_security_policy { 'Network security: Force logoff when logon hours expire':
  #   ensure         => 'present',
  #   policy_setting => 'ForceLogoffWhenHourExpire',
  #   policy_type    => 'System Access',
  #   policy_value   => '1',
  # }
  #
  # # V-73729
  # # The Access Credential Manager as a trusted caller user right must not be assigned to any groups or accounts.
  # local_security_policy { 'Access Credential Manager as a trusted caller':
  #   ensure         => 'absent',
  # }
  #
  # # V-73731
  # # The Access this computer from the network user right must only be assigned to the Administrators, Authenticated Users, and
  # # Enterprise Domain Controllers groups on domain controllers.
  # # V-73733
  # # The Access this computer from the network user right must only be assigned to the Administrators and Authenticated Users groups
  # # on member servers.
  # if($facts['windows_server_type'] == 'windowsdc') {
  #   local_security_policy { 'Access this computer from the network':
  #     ensure         => 'present',
  #     policy_setting => 'SeNetworkLogonRight',
  #     policy_type    => 'Privilege Rights',
  #     policy_value   => '*S-1-5-32-544,*S-1-5-11,*S-1-5-9',
  #   }
  # }
  # else {
  #   local_security_policy { 'Access this computer from the network':
  #     ensure         => 'present',
  #     policy_setting => 'SeNetworkLogonRight',
  #     policy_type    => 'Privilege Rights',
  #     policy_value   => '*S-1-5-32-544,*S-1-5-11',
  #   }
  # }
  #
  # # V-73735
  # # The Act as part of the operating system user right must not be assigned to any groups or accounts.
  # local_security_policy { 'Act as part of the operating system':
  #   ensure         => 'absent',
  # }
  #
  # # V-73737
  # # The Add workstations to domain user right must only be assigned to the Administrators group.
  # if($facts['windows_server_type'] == 'windowsdc') {
  #   local_security_policy { 'Add workstations to domain':
  #     ensure         => 'present',
  #     policy_setting => 'SeMachineAccountPrivilege',
  #     policy_type    => 'Privilege Rights',
  #     policy_value   => '*S-1-5-32-544',
  #   }
  # }
  #
  # # V-73739
  # # The Allow log on locally user right must only be assigned to the Administrators group.
  # local_security_policy { 'Allow log on locally':
  #   ensure         => 'present',
  #   policy_setting => 'SeInteractiveLogonRight',
  #   policy_type    => 'Privilege Rights',
  #   policy_value   => '*S-1-5-32-544',
  # }
  #
  # # V-73741
  # # The Allow log on through Remote Desktop Services user right must only be assigned to the Administrators group.
  # if($facts['windows_server_type'] == 'windowsdc') {
  #   local_security_policy { 'Allow log on through Remote Desktop Services':
  #     ensure         => 'present',
  #     policy_setting => 'SeRemoteInteractiveLogonRight',
  #     policy_type    => 'Privilege Rights',
  #     policy_value   => '*S-1-5-32-544',
  #   }
  # }
  #
  # # V-73743
  # # The Back up files and directories user right must only be assigned to the Administrators group.
  # local_security_policy { 'Back up files and directories':
  #   ensure         => 'present',
  #   policy_setting => 'SeBackupPrivilege',
  #   policy_type    => 'Privilege Rights',
  #   policy_value   => '*S-1-5-32-544',
  # }
  #
  # # V-73745
  # # The Create a pagefile user right must only be assigned to the Administrators group.
  # local_security_policy { 'Create a pagefile':
  #   ensure         => 'present',
  #   policy_setting => 'SeCreatePagefilePrivilege',
  #   policy_type    => 'Privilege Rights',
  #   policy_value   => '*S-1-5-32-544',
  # }
  #
  # # V-73747
  # # The Create a token object user right must not be assigned to any groups or accounts.
  # local_security_policy { 'Create a token object':
  #   ensure         => 'absent',
  # }
  #
  # # V-73749
  # # The Create global objects user right must only be assigned to Administrators, Service, Local Service, and Network Service.
  # local_security_policy { 'Create global objects':
  #   ensure         => 'present',
  #   policy_setting => 'SeCreateGlobalPrivilege',
  #   policy_type    => 'Privilege Rights',
  #   policy_value   => '*S-1-5-19,*S-1-5-20,*S-1-5-32-544,*S-1-5-6',
  # }
  #
  # # V-73751
  # # The Create permanent shared objects user right must not be assigned to any groups or accounts.
  # local_security_policy { 'Create permanent shared objects':
  #   ensure         => 'absent',
  # }
  #
  # # V-73753
  # # The Create symbolic links user right must only be assigned to the Administrators group.
  # if ($facts['windows_role'] and
  #     $facts['windows_role'] =~ /(^20|,20,|,20$)/) {
  #   local_security_policy { 'Create symbolic links':
  #     ensure         => 'present',
  #     policy_setting => 'SeCreateSymbolicLinkPrivilege',
  #     policy_type    => 'Privilege Rights',
  #     policy_value   => '*S-1-5-32-544,*S-1-5-83-0',
  #   }
  # }
  # else {
  #   local_security_policy { 'Create symbolic links':
  #     ensure         => 'present',
  #     policy_setting => 'SeCreateSymbolicLinkPrivilege',
  #     policy_type    => 'Privilege Rights',
  #     policy_value   => '*S-1-5-32-544',
  #   }
  # }
  #
  # # V-73755
  # # The Debug programs user right must only be assigned to the Administrators group.
  # local_security_policy { 'Debug programs':
  #   ensure         => 'present',
  #   policy_setting => 'SeDebugPrivilege',
  #   policy_type    => 'Privilege Rights',
  #   policy_value   => '*S-1-5-32-544',
  # }
  #
  # # V-73757
  # # The Deny access to this computer from the network user right on domain controllers must be configured to prevent
  # # unauthenticated access.
  # if($facts['windows_server_type'] == 'windowsdc') {
  #   local_security_policy { 'Deny access to this computer from the network':
  #     ensure         => 'present',
  #     policy_setting => 'SeDenyNetworkLogonRight',
  #     policy_type    => 'Privilege Rights',
  #     policy_value   => '*S-1-5-32-546',
  #   }
  # }
  # else {
  #   # V-73759
  #   # The Deny access to this computer from the network user right on member servers must be configured to prevent
  #   # access from highly privileged domain accounts and local accounts on domain systems, and from unauthenticated access on all systems.
  #   if($facts['windows_type'] =~ /(0|2)/) {
  #     #standalone
  #     local_security_policy { 'Deny access to this computer from the network':
  #       ensure         => 'present',
  #       policy_setting => 'SeDenyNetworkLogonRight',
  #       policy_type    => 'Privilege Rights',
  #       policy_value   => '*S-1-5-32-546',
  #     }
  #   }
  #   elsif ($facts['windows_type'] =~ /(1|3)/) {
  #     #member server
  #     local_security_policy { 'Deny access to this computer from the network':
  #       ensure         => 'present',
  #       policy_setting => 'SeDenyNetworkLogonRight',
  #       policy_type    => 'Privilege Rights',
  #       policy_value   => '*S-1-5-32-546',
  #     }
  #   }
  # }
  #
  # # # V-73759
  # # # The Deny access to this computer from the network user right on member servers must be configured to prevent
  # # # access from highly privileged domain accounts and local accounts on domain systems, and from unauthenticated access on all systems.
  # # if($facts['windows_type'] =~ /(0|2)/) {
  # #   #standalone
  # #   local_security_policy { 'Deny access to this computer from the network':
  # #     ensure         => 'present',
  # #     policy_setting => 'SeDenyNetworkLogonRight',
  # #     policy_type    => 'Privilege Rights',
  # #     policy_value   => '*S-1-5-32-546',
  # #   }
  # # }
  # # elsif ($facts['windows_type'] =~ /(1|3)/) {
  # #   #member server
  # #   local_security_policy { 'Deny access to this computer from the network':
  # #     ensure         => 'present',
  # #     policy_setting => 'SeDenyNetworkLogonRight',
  # #     policy_type    => 'Privilege Rights',
  # #     policy_value   => '*S-1-5-32-546',
  # #   }
  # # }
  #
  # # V-73761
  # # The Deny log on as a batch job user right on domain controllers must be configured to prevent unauthenticated access.
  # if($facts['windows_server_type'] == 'windowsdc') {
  #   local_security_policy { 'Deny log on as a batch job':
  #     ensure         => 'present',
  #     policy_setting => 'SeDenyBatchLogonRight',
  #     policy_type    => 'Privilege Rights',
  #     policy_value   => '*S-1-5-32-546',
  #   }
  # }
  #
  # # V-73763
  # # The Deny log on as a batch job user right on member servers must be configured to prevent access from highly privileged domain
  # # accounts on domain systems and from unauthenticated access on all systems.
  #
  #
  # # V-73765
  # # The Deny log on as a service user right must be configured to include no accounts or groups (blank) on domain controllers.
  # if($facts['windows_server_type'] == 'windowsdc') {
  #   local_security_policy { 'Deny log on as a service':
  #     ensure         => 'absent',
  #   }
  # }
  #
  # # V-73767
  # # The Deny log on as a service user right on member servers must be configured to prevent access from highly privileged domain
  # # accounts on domain systems. No other groups or accounts must be assigned this right.
  #
  #
  # # V-73769
  # # The Deny log on locally user right on domain controllers must be configured to prevent unauthenticated access.
  # if($facts['windows_server_type'] == 'windowsdc') {
  #   local_security_policy { 'Deny log on locally':
  #     ensure         => 'present',
  #     policy_setting => 'SeDenyInteractiveLogonRight',
  #     policy_type    => 'Privilege Rights',
  #     policy_value   => '*S-1-5-32-546',
  #   }
  # }
  #
  # # V-73771
  # # The Deny log on locally user right on member servers must be configured to prevent access from highly privileged domain accounts on
  # # domain systems and from unauthenticated access on all systems.
  #
  #
  # # V-73773
  # # The Deny log on through Remote Desktop Services user right on domain controllers must be configured to prevent unauthenticated access.
  # if($facts['windows_server_type'] == 'windowsdc') {
  #   local_security_policy { 'Deny log on through Remote Desktop Services':
  #     ensure         => 'present',
  #     policy_setting => 'SeDenyRemoteInteractiveLogonRight',
  #     policy_type    => 'Privilege Rights',
  #     policy_value   => '*S-1-5-32-546',
  #   }
  # }
  #
  # # V-73775
  # # The Deny log on through Remote Desktop Services user right on member servers must be configured to prevent access from highly
  # # privileged domain accounts and all local accounts on domain systems and from unauthenticated access on all systems.
  #
  #
  # # V-73777
  # # The Enable computer and user accounts to be trusted for delegation user right must only be assigned to the Administrators group on
  # # domain controllers.
  # if($facts['windows_server_type'] == 'windowsdc') {
  #   local_security_policy { 'Enable computer and user accounts to be trusted for delegation':
  #     ensure         => 'present',
  #     policy_setting => 'SeEnableDelegationPrivilege',
  #     policy_type    => 'Privilege Rights',
  #     policy_value   => '*S-1-5-32-544',
  #   }
  # }
  #
  # # V-73779
  # # The Enable computer and user accounts to be trusted for delegation user right must not be assigned to any groups or accounts on member
  # # servers.
  # if($facts['windows_server_type'] == 'MemberServer') {
  #   local_security_policy { 'Enable computer and user accounts to be trusted for delegation':
  #     ensure         => 'absent',
  #   }
  # }
  #
  # # V-73781
  # # The Force shutdown from a remote system user right must only be assigned to the Administrators group.
  # local_security_policy { 'Force shutdown from a remote system':
  #   ensure         => 'present',
  #   policy_setting => 'SeRemoteShutdownPrivilege',
  #   policy_type    => 'Privilege Rights',
  #   policy_value   => '*S-1-5-32-544',
  # }
  #
  # # V-73783
  # # The Generate security audits user right must only be assigned to Local Service and Network Service.
  # local_security_policy { 'Generate security audits':
  #   ensure         => 'present',
  #   policy_setting => 'SeAuditPrivilege',
  #   policy_type    => 'Privilege Rights',
  #   policy_value   => '*S-1-5-19,*S-1-5-20',
  # }
  #
  # # V-73785
  # # The Impersonate a client after authentication user right must only be assigned to Administrators, Service, Local Service, and Network
  # # Service.
  # local_security_policy { 'Impersonate a client after authentication':
  #   ensure         => 'present',
  #   policy_setting => 'SeImpersonatePrivilege',
  #   policy_type    => 'Privilege Rights',
  #   policy_value   => '*S-1-5-19,*S-1-5-20,*S-1-5-32-544,*S-1-5-6',
  # }
  #
  # # V-73787
  # # The Increase scheduling priority user right must only be assigned to the Administrators group.
  # local_security_policy { 'Increase scheduling priority':
  #   ensure         => 'present',
  #   policy_setting => 'SeIncreaseBasePriorityPrivilege',
  #   policy_type    => 'Privilege Rights',
  #   policy_value   => '*S-1-5-32-544',
  # }
  #
  # # V-73789
  # # The Load and unload device drivers user right must only be assigned to the Administrators group.
  # local_security_policy { 'Load and unload device drivers':
  #   ensure         => 'present',
  #   policy_setting => 'SeLoadDriverPrivilege',
  #   policy_type    => 'Privilege Rights',
  #   policy_value   => '*S-1-5-32-544',
  # }
  #
  # # V-73791
  # # The Lock pages in memory user right must not be assigned to any groups or accounts.
  # local_security_policy { 'Lock pages in memory':
  #   ensure         => 'absent',
  # }
  #
  # # V-73793
  # # The Manage auditing and security log user right must only be assigned to the Administrators group.
  # local_security_policy { 'Manage auditing and security log':
  #   ensure         => 'present',
  #   policy_setting => 'SeSecurityPrivilege',
  #   policy_type    => 'Privilege Rights',
  #   policy_value   => '*S-1-5-32-544',
  # }
  #
  # # V-73795
  # # The Modify firmware environment values user right must only be assigned to the Administrators group.
  # local_security_policy { 'Modify firmware environment values':
  #   ensure         => 'present',
  #   policy_setting => 'SeSystemEnvironmentPrivilege',
  #   policy_type    => 'Privilege Rights',
  #   policy_value   => '*S-1-5-32-544',
  # }
  #
  # # V-73797
  # # The Perform volume maintenance tasks user right must only be assigned to the Administrators group.
  # local_security_policy { 'Perform volume maintenance tasks':
  #   ensure         => 'present',
  #   policy_setting => 'SeManageVolumePrivilege',
  #   policy_type    => 'Privilege Rights',
  #   policy_value   => '*S-1-5-32-544',
  # }
  #
  # # V-73799
  # # The Profile single process user right must only be assigned to the Administrators group.
  # local_security_policy { 'Profile single process':
  #   ensure         => 'present',
  #   policy_setting => 'SeProfileSingleProcessPrivilege',
  #   policy_type    => 'Privilege Rights',
  #   policy_value   => '*S-1-5-32-544',
  # }
  #
  # # V-73801
  # # The Restore files and directories user right must only be assigned to the Administrators group.
  # local_security_policy { 'Restore files and directories':
  #   ensure         => 'present',
  #   policy_setting => 'SeRestorePrivilege',
  #   policy_type    => 'Privilege Rights',
  #   policy_value   => '*S-1-5-32-544',
  # }
  #
  # # V-73803
  # # The Take ownership of files or other objects user right must only be assigned to the Administrators group.
  # local_security_policy { 'Take ownership of files or other objects':
  #   ensure         => 'present',
  #   policy_setting => 'SeTakeOwnershipPrivilege',
  #   policy_type    => 'Privilege Rights',
  #   policy_value   => '*S-1-5-32-544',
  # }
  #
  # # V-73809
  # # The built-in guest account must be disabled.
  # local_security_policy { 'EnableGuestAccount':
  #   ensure         => 'present',
  #   policy_setting => 'EnableGuestAccount',
  #   policy_type    => 'System Access',
  #   policy_value   => '0',
  # }
}
