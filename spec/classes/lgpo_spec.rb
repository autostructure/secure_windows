require 'spec_helper'
describe 'secure_windows lgpo' do
  context 'lgpo defaults' do
    let(:facts) { { 'windows_type' => '2', 'operatingsystem' => 'windows' } }
    it {
        should contain_local_security_policy('Account lockout duration').with(
          'ensure'         => 'present',
          'policy_setting' => 'LockoutDuration',
          'policy_type'    => 'System Access',
          'policy_value'   => '15'
        )
    }
    it {
        should contain_local_security_policy('Account lockout threshold').with(
          'ensure'         => 'present',
          'policy_setting' => 'LockoutBadCount',
          'policy_type'    => 'System Access',
          'policy_value'   => '3'
        )
    }
    it {
        should contain_local_security_policy('Reset account lockout counter after').with(
          'ensure'         => 'present',
          'policy_setting' => 'ResetLockoutCount',
          'policy_type'    => 'System Access',
          'policy_value'   => '15'
        )
    }
    it {
      should contain_local_security_policy('Enforce password history').with(
        'ensure' => 'present',
        'policy_setting' => 'PasswordHistorySize',
        'policy_type' => 'System Access',
        'policy_value' => '24'
      )
    }
    it {
      should contain_local_security_policy('Maximum password age').with(
        'ensure'         => 'present',
        'policy_setting' => 'MaximumPasswordAge',
        'policy_type'    => 'System Access',
        'policy_value'   => '60'
      )
    }
    it {
      should contain_local_security_policy('Minimum password age').with(
        'ensure'         => 'present',
        'policy_setting' => 'MinimumPasswordAge',
        'policy_type'    => 'System Access',
        'policy_value'   => '1'
      )
    }
    it {
      should contain_local_security_policy('Minimum password length').with(
        'ensure'         => 'present',
        'policy_setting' => 'MinimumPasswordLength',
        'policy_type'    => 'System Access',
        'policy_value'   => '14'
      )
    }
    it {
      should contain_local_security_policy('Password must meet complexity requirements').with(
        'ensure'         => 'present',
        'policy_setting' => 'PasswordComplexity',
        'policy_type'    => 'System Access',
        'policy_value'   => '1'
      )
    }
    it {
      should contain_local_security_policy('Store passwords using reversible encryption').with(
        'ensure'         => 'present',
        'policy_setting' => 'ClearTextPassword',
        'policy_type'    => 'System Access',
        'policy_value'   => '0'
      )
    }
    it {
        should contain_local_security_policy('Accounts: Rename administrator account').with(
          'ensure'         => 'present',
          'policy_setting' => 'NewAdministratorName',
          'policy_type'    => 'System Access',
          'policy_value'   => '"adminaccount"'
        )
    }
    it {
        should contain_local_security_policy('Accounts: Rename guest account').with(
          'ensure'         => 'present',
          'policy_setting' => 'NewGuestName',
          'policy_type'    => 'System Access',
          'policy_value'   => '"guestaccount"'
        )
    }
    it {
        should contain_local_security_policy('Network access: Allow anonymous SID/name translation').with(
          'ensure'         => 'present',
          'policy_setting' => 'LSAAnonymousNameLookup',
          'policy_type'    => 'System Access',
          'policy_value'   => '0'
        )
    }
    it {
        should contain_local_security_policy('Network security: Force logoff when logon hours expire').with(
          'ensure'         => 'present',
          'policy_setting' => 'ForceLogoffWhenHourExpire',
          'policy_type'    => 'System Access',
          'policy_value'   => '1'
        )
    }
    it {
        should contain_local_security_policy('Act as part of the operating system').with(
          'ensure'         => 'absent'
        )
    }
    it {
      should contain_local_security_policy('Allow log on locally').with(
        'ensure'         => 'present',
        'policy_setting' => 'SeInteractiveLogonRight',
        'policy_type'    => 'Privilege Rights',
        'policy_value'   => '*S-1-5-32-544'
      )
    }
    it {
      should contain_local_security_policy('Back up files and directories').with(
        'ensure'         => 'present',
        'policy_setting' => 'SeBackupPrivilege',
        'policy_type'    => 'Privilege Rights',
        'policy_value'   => '*S-1-5-32-544'
      )
    }
    it {
      should contain_local_security_policy('Create a pagefile').with(
        'ensure'         => 'present',
        'policy_setting' => 'SeCreatePagefilePrivilege',
        'policy_type'    => 'Privilege Rights',
        'policy_value'   => '*S-1-5-32-544'
      )
    }
    it {
      should contain_local_security_policy('Create a token object').with(
        'ensure'         => 'absent'
      )
    }
    it {
      should contain_local_security_policy('Create global objects').with(
        'ensure'         => 'present',
        'policy_setting' => 'SeCreateGlobalPrivilege',
        'policy_type'    => 'Privilege Rights',
        'policy_value'   => '*S-1-5-19,*S-1-5-20,*S-1-5-32-544,*S-1-5-6'
      )
    }
    it {
      should contain_local_security_policy('Create permanent shared objects').with(
        'ensure'         => 'absent'
      )
    }
    it {
      should contain_local_security_policy('Debug programs').with(
        'ensure'         => 'present',
        'policy_setting' => 'SeDebugPrivilege',
        'policy_type'    => 'Privilege Rights',
        'policy_value'   => '*S-1-5-32-544'
      )
    }
    it {
      should contain_local_security_policy('Force shutdown from a remote system').with(
        'ensure'         => 'present',
        'policy_setting' => 'SeRemoteShutdownPrivilege',
        'policy_type'    => 'Privilege Rights',
        'policy_value'   => '*S-1-5-32-544'
      )
    }
    it {
      should contain_local_security_policy('Generate security audits').with(
        'ensure'         => 'present',
        'policy_setting' => 'SeAuditPrivilege',
        'policy_type'    => 'Privilege Rights',
        'policy_value'   => '*S-1-5-19,*S-1-5-20'
      )
    }
    it {
      should contain_local_security_policy('Impersonate a client after authentication').with(
        'ensure'         => 'present',
        'policy_setting' => 'SeImpersonatePrivilege',
        'policy_type'    => 'Privilege Rights',
        'policy_value'   => '*S-1-5-19,*S-1-5-20,*S-1-5-32-544,*S-1-5-6'
      )
    }
    it {
      should contain_local_security_policy('Increase scheduling priority').with(
        'ensure'         => 'present',
        'policy_setting' => 'SeIncreaseBasePriorityPrivilege',
        'policy_type'    => 'Privilege Rights',
        'policy_value'   => '*S-1-5-32-544'
      )
    }
    it {
      should contain_local_security_policy('Load and unload device drivers').with(
        'ensure'         => 'present',
        'policy_setting' => 'SeLoadDriverPrivilege',
        'policy_type'    => 'Privilege Rights',
        'policy_value'   => '*S-1-5-32-544'
      )
    }
    it {
      should contain_local_security_policy('Lock pages in memory').with(
        'ensure'         => 'absent'
      )
    }
    it {
      should contain_local_security_policy('Manage auditing and security log').with(
        'ensure'         => 'present',
        'policy_setting' => 'SeSecurityPrivilege',
        'policy_type'    => 'Privilege Rights',
        'policy_value'   => '*S-1-5-32-544'
      )
    }
    it {
      should contain_local_security_policy('Modify firmware environment values').with(
        'ensure'         => 'present',
        'policy_setting' => 'SeSystemEnvironmentPrivilege',
        'policy_type'    => 'Privilege Rights',
        'policy_value'   => '*S-1-5-32-544'
      )
    }
    it {
      should contain_local_security_policy('Perform volume maintenance tasks').with(
        'ensure'         => 'present',
        'policy_setting' => 'SeManageVolumePrivilege',
        'policy_type'    => 'Privilege Rights',
        'policy_value'   => '*S-1-5-32-544'
      )
    }
    it {
      should contain_local_security_policy('Profile single process').with(
        'ensure'         => 'present',
        'policy_setting' => 'SeProfileSingleProcessPrivilege',
        'policy_type'    => 'Privilege Rights',
        'policy_value'   => '*S-1-5-32-544'
      )
    }
    it {
      should contain_local_security_policy('Restore files and directories').with(
        'ensure'         => 'present',
        'policy_setting' => 'SeRestorePrivilege',
        'policy_type'    => 'Privilege Rights',
        'policy_value'   => '*S-1-5-32-544'
      )
    }
    it {
      should contain_local_security_policy('Take ownership of files or other objects').with(
        'ensure'         => 'present',
        'policy_setting' => 'SeTakeOwnershipPrivilege',
        'policy_type'    => 'Privilege Rights',
        'policy_value'   => '*S-1-5-32-544'
      )
    }
  end
end
