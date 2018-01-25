#
# This spec test will test for resources that only apply to domain controllers
#
require 'spec_helper'
describe 'lgpo_dc_spec' do
  context 'lgpo domain controller' do
    let(:facts) { { 'windows_type' => '2', 'operatingsystem' => 'windows', 'windows_server_type' => 'windowsdc' } }

    it {
      is_expected.to contain_local_security_policy('Add workstations to domain').with(
        'ensure'         => 'present',
        'policy_setting' => 'SeMachineAccountPrivilege',
        'policy_type'    => 'Privilege Rights',
        'policy_value'   => '*S-1-5-32-544',
      )
    }
    it {
      is_expected.to contain_local_security_policy('Allow log on through Remote Desktop Services').with(
        'ensure'         => 'present',
        'policy_setting' => 'SeRemoteInteractiveLogonRight',
        'policy_type'    => 'Privilege Rights',
        'policy_value'   => '*S-1-5-32-544',
      )
    }
    it {
      is_expected.to contain_local_security_policy('Deny access to this computer from the network').with(
        'ensure'         => 'present',
        'policy_setting' => 'SeDenyNetworkLogonRight',
        'policy_type'    => 'Privilege Rights',
        'policy_value'   => '*S-1-5-32-546',
      )
    }
    it {
      is_expected.to contain_local_security_policy('Deny log on as a batch job').with(
        'ensure'         => 'present',
        'policy_setting' => 'SeDenyBatchLogonRight',
        'policy_type'    => 'Privilege Rights',
        'policy_value'   => '*S-1-5-32-546',
      )
    }
    it {
      is_expected.to contain_local_security_policy('Deny log on as a service').with(
        'ensure'         => 'absent',
      )
    }
    it {
      is_expected.to contain_local_security_policy('Deny log on locally').with(
        'ensure'         => 'present',
        'policy_setting' => 'SeDenyInteractiveLogonRight',
        'policy_type'    => 'Privilege Rights',
        'policy_value'   => '*S-1-5-32-546',
      )
    }
    it {
      is_expected.to contain_local_security_policy('Deny log on through Remote Desktop Services').with(
        'ensure'         => 'present',
        'policy_setting' => 'SeDenyRemoteInteractiveLogonRight',
        'policy_type'    => 'Privilege Rights',
        'policy_value'   => '*S-1-5-32-546',
      )
    }
    it {
      is_expected.to contain_local_security_policy('Enable computer and user accounts to be trusted for delegation').with(
        'ensure'         => 'present',
        'policy_setting' => 'SeEnableDelegationPrivilege',
        'policy_type'    => 'Privilege Rights',
        'policy_value'   => '*S-1-5-32-544',
      )
    }
  end
end
