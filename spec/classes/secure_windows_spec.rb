require 'spec_helper'

describe 'secure_windows' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
    end
  end
end
