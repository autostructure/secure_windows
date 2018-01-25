require 'spec_helper'

describe 'secure_windows' do
  context 'with supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
          let(:facts) { { 'windows_type' => '2', 'operatingsystem' => 'windows' } }
        end

        print facts

        # let(:facts) do
        #   {
        #     architecture:           'x64',
        #     osfamily:               'windows',
        #     kernel:                 'windows',
        #     operatingsystem:        'windows',
        #     operatingsystemrelease: '2016',
        #     staged_package:         nil,
        #   }
        # end

        context 'with secure_windows class without any parameters' do
          it { is_expected.to compile.with_all_deps }

          # it { is_expected.to contain_class('secure_windows') }
          # it { is_expected.to contain_class('secure_windows::auditpol') }
          # it { is_expected.to contain_class('secure_windows::lpgo') }
          # it { is_expected.to contain_class('secure_windows::registry_editor') }
        end
      end
    end
  end
end
