require 'spec_helper'

describe 'secure_windows' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts.merge(
          windows_type: '2',
          windows_server_type: 'windowsdc',
          windows_role: '2',
        )
      end

      it { is_expected.to compile }
    end
  end
end
