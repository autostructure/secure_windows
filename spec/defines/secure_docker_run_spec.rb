require 'spec_helper'

describe 'secure_docker::run' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      let(:title) { 'some_container' }

      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "secure_docker_run defines without any parameters" do
          it { is_expected.not_to compile.with_all_deps }
        end

        context "secure_docker_run defines with min parameters" do
          let(:params) {
            {
              image: 'some_image',
              memory_limit: '5m',
              extra_parameters: [
                '--read-only'
              ]
            }
          }

          it { is_expected.to compile.with_all_deps }
          it { is_expected.to contain_docker__run('some_container') }
        end

        context "secure_docker_run defines with --pid==host" do
          let(:params) {
            {
              image: 'some_image',
              memory_limit: '5m',
              extra_parameters: [
                '--pid=host'
              ]
            }
          }

          it { is_expected.not_to compile.with_all_deps }
        end

        context "secure_docker_run defines with privileged host mapping" do
          let(:params) {
            {
              image: 'some_image',
              memory_limit: '5m',
              ports: [
                '192.168.0.1:1023:8080',
              ]
            }
          }

          it { is_expected.not_to compile.with_all_deps }
        end

        context "secure_docker_run defines without privileged host mapping" do
          let(:params) {
            {
              image: 'some_image',
              memory_limit: '5m',
              ports: [
                '192.168.0.1:1024:8080',
              ]
            }
          }

          it { is_expected.to compile.with_all_deps }
        end

        context "secure_docker_run defines with just ports" do
          let(:params) {
            {
              image: 'some_image',
              memory_limit: '5m',
              ports: [
                '8081:8081',
              ]
            }
          }

          it { is_expected.to compile.with_all_deps }
        end

        context "secure_docker_run defines with just ports and udp" do
          let(:params) {
            {
              image: 'some_image',
              memory_limit: '5m',
              ports: [
                '8081:8081/udp',
              ]
            }
          }

          it { is_expected.to compile.with_all_deps }
        end

        context "secure_docker_run defines with crazy ports" do
          let(:params) {
            {
              image: 'some_image',
              memory_limit: '5m',
              ports: [
                '8081:99999999',
              ]
            }
          }

          it { is_expected.not_to compile.with_all_deps }
        end

        context "secure_docker_run defines allow additional privileges" do
          let(:params) {
            {
              image: 'some_image',
              memory_limit: '5m',
              allow_additional_privileges: true,
            }
          }

          it { is_expected.to compile.with_all_deps }

          it {
            is_expected.to contain_docker__run('some_container').with(
              'extra_parameters' => ['--read-only', '--cap-drop=all']
            )
          }
        end

        context "secure_docker_run defines with valid ip" do
          let(:params) {
            {
              image: 'some_image',
              memory_limit: '5m',
              ports: [
                '192.168.0.1:1024:8080',
              ]
            }
          }

          it { is_expected.to compile.with_all_deps }
        end

        context "secure_docker_run defines with invalid ip" do
          let(:params) {
            {
              image: 'some_image',
              memory_limit: '5m',
              ports: [
                '192.168.0.256:1024:8080',
              ]
            }
          }

          it { is_expected.not_to compile.with_all_deps }
        end

        context "secure_docker_run defines with sensitive mount" do
          let(:params) {
            {
              image: 'some_image',
              memory_limit: '5m',
              volumes: [
                '/boot:/boot',
              ]
            }
          }

          it { is_expected.not_to compile.with_all_deps }
        end

        context "secure_docker_run defines with sensitive mount 2" do
          let(:params) {
            {
              image: 'some_image',
              memory_limit: '5m',
              volumes: [
                ' /boot:/boot',
              ]
            }
          }

          it { is_expected.not_to compile.with_all_deps }
        end

        context "secure_docker_run defines with non-sensitive mount" do
          let(:params) {
            {
              image: 'some_image',
              memory_limit: '5m',
              volumes: [
                '/some/boot:/boot',
              ]
            }
          }

          it { is_expected.to compile.with_all_deps }
        end
      end
    end
  end
end
