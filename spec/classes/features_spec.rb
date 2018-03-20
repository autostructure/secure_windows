require 'spec_helper'

describe 'secure_windows::features' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }

      it {
        is_expected.to contain_windowsfeature('fax').with(
          'ensure' => 'absent',
        )
      }

      it {
        is_expected.to contain_windowsfeature('web-ftp-service').with(
          'ensure' => 'absent',
        )
      }

      it {
        is_expected.to contain_windowsfeature('pnrp').with(
          'ensure' => 'absent',
        )
      }

      it {
        is_expected.to contain_windowsfeature('simple-tcpip').with(
          'ensure' => 'absent',
        )
      }

      it {
        is_expected.to contain_windowsfeature('telnet-client').with(
          'ensure' => 'absent',
        )
      }

      it {
        is_expected.to contain_windowsfeature('tftp-client').with(
          'ensure' => 'absent',
        )
      }

      it {
        is_expected.to contain_windowsfeature('fs-smb1').with(
          'ensure' => 'absent',
        )
      }

      it {
        is_expected.to contain_windowsfeature('powershell-v2').with(
          'ensure' => 'absent',
        )
      }
    end
  end
end
