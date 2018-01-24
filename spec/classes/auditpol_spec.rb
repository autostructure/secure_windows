require 'spec_helper'
describe 'secure_windows auditpol' do
  context 'auditpol defaults' do
    it {
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> test
      should contain_auditpol('Credential Validation').with(
        'success' => 'enable',
        'failure' => 'enable'
      )
    }
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
    it {
      should contain_auditpol('Other Account Management Events').with(
        'success' => 'enable',
        'failure' => 'enable'
      )
    }
    it {
      should contain_auditpol('Security Group Management').with(
        'success' => 'enable',
        'failure' => 'enable'
      )
    }
    it {
      should contain_auditpol('User Account Management').with(
        'success' => 'enable',
        'failure' => 'enable'
      )
    }
    it {
      should contain_auditpol('Process Creation').with(
        'success' => 'enable',
        'failure' => 'disable'
      )
    }
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
    it {
      should contain_auditpol('Account Lockout').with(
        'success' => 'enable',
        'failure' => 'disable'
      )
    }
    it {
      should contain_auditpol('Logoff').with(
        'success' => 'enable',
        'failure' => 'disable'
      )
    }
    it {
      should contain_auditpol('Logon').with(
        'success' => 'enable',
        'failure' => 'enable'
      )
    }
    it {
      should contain_auditpol('Other Logon/Logoff Events').with(
        'success' => 'enable',
        'failure' => 'enable'
      )
    }
    it {
      should contain_auditpol('Special Logon').with(
        'success' => 'enable',
        'failure' => 'disable'
      )
    }
    it {
      should contain_auditpol('Audit Policy Change').with(
        'success' => 'enable',
        'failure' => 'enable'
      )
    }
    it {
      should contain_auditpol('Authentication Policy Change').with(
        'success' => 'enable',
        'failure' => 'disable'
      )
    }
    it {
      should contain_auditpol('Sensitive Privilege Use').with(
        'success' => 'enable',
        'failure' => 'enable'
      )
    }
    it {
      should contain_auditpol('IPsec Driver').with(
        'success' => 'enable',
        'failure' => 'enable'
      )
    }
    it {
      should contain_auditpol('Other System Events').with(
        'success' => 'enable',
        'failure' => 'enable'
      )
    }
    it {
      should contain_auditpol('Security State Change').with(
        'success' => 'enable',
        'failure' => 'disable'
      )
    }
    it {
      should contain_auditpol('Security System Extension').with(
        'success' => 'enable',
        'failure' => 'enable'
      )
    }
    it {
      should contain_auditpol('System Integrity').with(
        'success' => 'enable',
        'failure' => 'enable'
      )
    }
<<<<<<< HEAD
  end
end
=======
        should contain_auditpol('Credential Validation').with(
          'success' => 'enable',
          'failure' => 'enable'
        )
      }
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
      it {
        should contain_auditpol('Other Account Management Events').with(
          'success' => 'enable',
          'failure' => 'enable'
        )
      }
      it {
        should contain_auditpol('Security Group Management').with(
          'success' => 'enable',
          'failure' => 'enable'
        )
      }
      it {
        should contain_auditpol('User Account Management').with(
          'success' => 'enable',
          'failure' => 'enable'
        )
      }
      it {
        should contain_auditpol('Process Creation').with(
          'success' => 'enable',
          'failure' => 'disable'
        )
      }
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
      it {
        should contain_auditpol('Account Lockout').with(
          'success' => 'enable',
          'failure' => 'disable'
        )
      }
      it {
        should contain_auditpol('Logoff').with(
          'success' => 'enable',
          'failure' => 'disable'
        )
      }
      it {
        should contain_auditpol('Logon').with(
          'success' => 'enable',
          'failure' => 'enable'
        )
      }
      it {
        should contain_auditpol('Other Logon/Logoff Events').with(
          'success' => 'enable',
          'failure' => 'enable'
        )
      }
      it {
        should contain_auditpol('Special Logon').with(
          'success' => 'enable',
          'failure' => 'disable'
        )
      }
      it {
        should contain_auditpol('Audit Policy Change').with(
          'success' => 'enable',
          'failure' => 'enable'
        )
      }
      it {
        should contain_auditpol('Authentication Policy Change').with(
          'success' => 'enable',
          'failure' => 'disable'
        )
      }
      it {
        should contain_auditpol('Sensitive Privilege Use').with(
          'success' => 'enable',
          'failure' => 'enable'
        )
      }
      it {
        should contain_auditpol('IPsec Driver').with(
          'success' => 'enable',
          'failure' => 'enable'
        )
      }
      it {
        should contain_auditpol('Other System Events').with(
          'success' => 'enable',
          'failure' => 'enable'
        )
      }
      it {
        should contain_auditpol('Security State Change').with(
          'success' => 'enable',
          'failure' => 'disable'
        )
      }
      it {
        should contain_auditpol('Security System Extension').with(
          'success' => 'enable',
          'failure' => 'enable'
        )
      }
      it {
        should contain_auditpol('System Integrity').with(
          'success' => 'enable',
          'failure' => 'enable'
        )
      }
  end
end
>>>>>>> another typo
=======
  end
end
>>>>>>> test
