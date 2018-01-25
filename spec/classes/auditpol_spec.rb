require 'spec_helper'
describe 'secure_windows auditpol' do
  context 'auditpol defaults' do
    let(:facts) { { 'windows_type' => '2', 'operatingsystem' => 'windows' } }

    it {
      is_expected.to contain_auditpol('Credential Validation').with(
        'success' => 'enable',
        'failure' => 'enable',
      )
    }
    it {
      is_expected.to contain_auditpol('Other Account Management Events').with(
        'success' => 'enable',
        'failure' => 'enable',
      )
    }
    it {
      is_expected.to contain_auditpol('Security Group Management').with(
        'success' => 'enable',
        'failure' => 'enable',
      )
    }
    it {
      is_expected.to contain_auditpol('User Account Management').with(
        'success' => 'enable',
        'failure' => 'enable',
      )
    }
    it {
      is_expected.to contain_auditpol('Plug and Play Events').with(
        'success' => 'enable',
        'failure' => 'disable',
      )
    }
    it {
      is_expected.to contain_auditpol('Process Creation').with(
        'success' => 'enable',
        'failure' => 'disable',
      )
    }
    it {
      is_expected.to contain_auditpol('Account Lockout').with(
        'success' => 'enable',
        'failure' => 'enable',
      )
    }
    it {
      is_expected.to contain_auditpol('Group Membership').with(
        'success' => 'enable',
        'failure' => 'disable',
      )
    }
    it {
      is_expected.to contain_auditpol('Logoff').with(
        'success' => 'enable',
        'failure' => 'disable',
      )
    }
    it {
      is_expected.to contain_auditpol('Logon').with(
        'success' => 'enable',
        'failure' => 'enable',
      )
    }
    it {
      is_expected.to contain_auditpol('Special Logon').with(
        'success' => 'enable',
        'failure' => 'disable',
      )
    }
    it {
      is_expected.to contain_auditpol('Removable Storage').with(
        'success' => 'enable',
        'failure' => 'enable',
      )
    }
    it {
      is_expected.to contain_auditpol('Audit Policy Change').with(
        'success' => 'enable',
        'failure' => 'enable',
      )
    }
    it {
      is_expected.to contain_auditpol('Authentication Policy Change').with(
        'success' => 'enable',
        'failure' => 'disable',
      )
    }
    it {
      is_expected.to contain_auditpol('Authorization Policy Change').with(
        'success' => 'enable',
        'failure' => 'disable',
      )
    }
    it {
      is_expected.to contain_auditpol('Sensitive Privilege Use').with(
        'success' => 'enable',
        'failure' => 'enable',
      )
    }
    it {
      is_expected.to contain_auditpol('IPsec Driver').with(
        'success' => 'enable',
        'failure' => 'enable',
      )
    }
    it {
      is_expected.to contain_auditpol('Other System Events').with(
        'success' => 'enable',
        'failure' => 'enable',
      )
    }
    it {
      is_expected.to contain_auditpol('Security State Change').with(
        'success' => 'enable',
        'failure' => 'disable',
      )
    }
    it {
      is_expected.to contain_auditpol('Security System Extension').with(
        'success' => 'enable',
        'failure' => 'enable',
      )
    }
    it {
      is_expected.to contain_auditpol('System Integrity').with(
        'success' => 'enable',
        'failure' => 'enable',
      )
    }
  end
  context 'auditpol domain controller' do
    let(:facts) { { 'windows_type' => '2', 'operatingsystem' => 'windows', 'windows_server_type' => 'windowsdc' } }
    it {
      should contain_auditpol('Computer Account Management').with(
        'success' => 'enable',
        'failure' => 'disable'
      )
    }
    it {
      should contain_auditpol('Directory Service Access').with(
        'success' => 'enable',
        'failure' => 'enable'
      )
    }
    it {
      should contain_auditpol('Directory Service Changes').with(
        'success' => 'enable',
        'failure' => 'enable'
      )
    }
  end
end
