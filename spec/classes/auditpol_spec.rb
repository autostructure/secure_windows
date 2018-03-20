require 'spec_helper'

describe 'secure_windows::auditpol' do
  context 'auditpol defaults' do
<<<<<<< HEAD
    let(:facts) do
      facts.merge(
        windows_type: '2',
        windows_server_type: 'windowsdc',
        windows_role: '2',
      )
    end
    it {
      should contain_auditpol('Credential Validation').with(
=======
    let(:facts) { { 'windows_type' => '2', 'operatingsystem' => 'windows' } }

    it {
      is_expected.to contain_auditpol('Credential Validation').with(
>>>>>>> 1f54c62fd1209b241fadda8809348850ba6c1918
        'success' => 'enable',
        'failure' => 'enable',
      )
    }
<<<<<<< HEAD
    it {
      should contain_auditpol('Application Group Management').with(
        'success' => 'enable',
        'failure' => 'enable'
      )
    }
    it {
      should contain_auditpol('Computer Account Management').with(
        'success' => 'enable',
        'failure' => 'enable'
      )
    }
    # DC ONLY
    # it {
    #   should contain_auditpol('Distribution Group Management').with(
    #     'success' => 'enable',
    #     'failure' => 'enable'
    #   )
    # }
=======
>>>>>>> 1f54c62fd1209b241fadda8809348850ba6c1918
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
<<<<<<< HEAD
      should contain_auditpol('Process Creation').with(
=======
      is_expected.to contain_auditpol('Plug and Play Events').with(
        'success' => 'enable',
        'failure' => 'disable',
      )
    }
    it {
      is_expected.to contain_auditpol('Process Creation').with(
>>>>>>> 1f54c62fd1209b241fadda8809348850ba6c1918
        'success' => 'enable',
        'failure' => 'disable',
      )
    }
<<<<<<< HEAD
    # DC ONLY
    # it {
    #   should contain_auditpol('Directory Service Changes').with(
    #     'success' => 'enable',
    #     'failure' => 'enable'
    #   )
    # }
    # it {
    #   should contain_auditpol('Directory Service Access').with(
    #     'success' => 'enable',
    #     'failure' => 'enable'
    #   )
    # }
=======
>>>>>>> 1f54c62fd1209b241fadda8809348850ba6c1918
    it {
      is_expected.to contain_auditpol('Account Lockout').with(
        'success' => 'enable',
<<<<<<< HEAD
        'failure' => 'disable'
=======
        'failure' => 'enable',
      )
    }
    it {
      is_expected.to contain_auditpol('Group Membership').with(
        'success' => 'enable',
        'failure' => 'disable',
>>>>>>> 1f54c62fd1209b241fadda8809348850ba6c1918
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
<<<<<<< HEAD
      should contain_auditpol('Other Logon/Logoff Events').with(
        'success' => 'enable',
        'failure' => 'enable'
      )
    }
    it {
      should contain_auditpol('Special Logon').with(
        'success' => 'enable',
        'failure' => 'disable'
=======
      is_expected.to contain_auditpol('Special Logon').with(
        'success' => 'enable',
        'failure' => 'disable',
      )
    }
    it {
      is_expected.to contain_auditpol('Removable Storage').with(
        'success' => 'enable',
        'failure' => 'enable',
>>>>>>> 1f54c62fd1209b241fadda8809348850ba6c1918
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
<<<<<<< HEAD
      should contain_auditpol('Sensitive Privilege Use').with(
=======
      is_expected.to contain_auditpol('Authorization Policy Change').with(
        'success' => 'enable',
        'failure' => 'disable',
      )
    }
    it {
      is_expected.to contain_auditpol('Sensitive Privilege Use').with(
>>>>>>> 1f54c62fd1209b241fadda8809348850ba6c1918
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
<<<<<<< HEAD
=======
  end
  context 'auditpol domain controller' do
    let(:facts) { { 'windows_type' => '2', 'operatingsystem' => 'windows', 'windows_server_type' => 'windowsdc' } }

    it {
      is_expected.to contain_auditpol('Computer Account Management').with(
        'success' => 'enable',
        'failure' => 'disable',
      )
    }
    it {
      is_expected.to contain_auditpol('Directory Service Access').with(
        'success' => 'enable',
        'failure' => 'enable',
      )
    }
    it {
      is_expected.to contain_auditpol('Directory Service Changes').with(
        'success' => 'enable',
        'failure' => 'enable',
      )
    }
>>>>>>> 1f54c62fd1209b241fadda8809348850ba6c1918
  end
end
