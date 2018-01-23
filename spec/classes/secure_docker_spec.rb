require 'spec_helper'

describe 'secure_docker' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        # 2.4 Do not use insecure registries (Scored)
        # 2.5 Do not use the aufs storage driver (Scored)
        # let(:params) {
        #   {
        #     extra_parameters: ['--storage-driver aufs', '--insecure-registry some_registry']
        #   }
        # }

        context "secure_docker class without any parameters" do
          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('secure_docker') }
          it {
            is_expected.to contain_class('secure_docker::install').that_comes_before(
              'Class[secure_docker::config]'
            )
          }
          it { is_expected.to contain_class('secure_docker::config').that_notifies('Class[secure_docker::service_auditd]') }
          it { is_expected.to contain_class('secure_docker::service_auditd').that_comes_before('Class[secure_docker]') }

          # 2.1 Restrict network traffic between containers
          # 2.2 Set the logging level (Scored)
          # 2.3 Allow Docker to make changes to iptables
          # 2.13 Disable operations on legacy registry (v1)
          # 2.14 Enable live restore
          # 2.18 Disable Userland Proxy
          it {
            is_expected.to contain_class('docker').with(
              'log_level' => 'info',
              'extra_parameters' => %w(--icc=false --iptables=true --disable-legacy-registry --live-restore --userland-proxy=false)
            )
          }

          # 1.1 Create a separate partition for containers (Scored)
          # it {
          #   is_expected.to contain_mount('/var/lib/docker').with('ensure' => 'present')
          # }

          it {
            is_expected.to contain_file('/etc/audit/rules.d/docker.rules').with( 'ensure' => 'file')
          }

          it {
            is_expected.to contain_file('/etc/default/docker').with(
              'ensure' => 'file',
              'owner'  => 'root',
              'group'  => 'root',
              'mode'   => 'a-x,go-w'
            )
          }

          it {
            is_expected.to contain_file('/etc/docker/certs.d').with(
              'ensure'  => 'directory',
              'owner'   => 'root',
              'group'   => 'root',
              'recurse' => true,
              'mode'    => 'a-rx'
            )
          }

          it {
            is_expected.to contain_file('/etc/docker/daemon.json').with(
              'ensure' => 'absent',
              'owner'  => 'root',
              'group'  => 'root',
              'mode'   => 'a-x,go-w'
            )
          }

          it {
            is_expected.to contain_file('/etc/docker').with(
              'ensure' => 'directory',
              'owner'  => 'root',
              'group'  => 'root',
              'mode'   => 'go-w'
            )
          }

          it {
            is_expected.to contain_file('/var/run/docker.sock').with(
              'owner'  => 'root',
              'group'  => 'docker',
              'mode'   => 'a-x,o-rwx'
            )
          }

          # 1.7 Audit docker daemon (Scored)
          it {
            is_expected.to contain_file_line('docker_daemon_audit').with(
              'path' => '/etc/audit/rules.d/docker.rules',
              'line' => '-w /usr/bin/docker -k docker'
            )
          }

          # 1.8 Audit Docker files and directories - /var/lib/docker (Scored)
          it {
            is_expected.to contain_file_line('docker_var_files_audit').with(
              'path' => '/etc/audit/rules.d/docker.rules',
              'line' => '-w /var/lib/docker -k docker'
            )
          }

          # 1.9 Audit Docker files and directories - /etc/docker (Scored)
          it {
            is_expected.to contain_file_line('docker_etc_files_audit').with(
              'path' => '/etc/audit/rules.d/docker.rules',
              'line' => '-w /etc/docker -k docker'
            )
          }

          # 1.10 Audit Docker files and directories - docker.service (Scored)
          it {
            is_expected.to contain_file_line('docker_registry_service_audit').with(
              'path' => '/etc/audit/rules.d/docker.rules',
              'line' => '-w /usr/lib/systemd/system/docker.service -k docker'
            )
          }

          # 1.11 Audit Docker files and directories - docker.socket (Scored)
          it {
            is_expected.to contain_file_line('docker_sock_audit').with(
              'path' => '/etc/audit/rules.d/docker.rules',
              'line' => '-w /usr/lib/systemd/system/docker.socket -k docker'
            )
          }

          # 1.12 Audit Docker files and directories - /etc/default/docker (Scored)
          it {
            is_expected.to contain_file_line('docker_sysconfig_audit').with(
              'path' => '/etc/audit/rules.d/docker.rules',
              'line' => '-w /etc/default/docker -k docker'
            )
          }

          # 1.13 Audit Docker files and directories - /etc/docker/daemon.json (Scored)
          it {
            is_expected.to contain_file_line('docker_daemon_json_audit').with(
              'path' => '/etc/audit/rules.d/docker.rules',
              'line' => '-w /etc/docker/daemon.json -k docker'
            )
          }

          # 1.14 Audit Docker files and directories - /usr/bin/docker-containerd (Scored)
          it {
            is_expected.to contain_file_line('docker_containerd_audit').with(
              'path' => '/etc/audit/rules.d/docker.rules',
              'line' => '-w /usr/bin/docker-containerd -k docker'
            )
          }

          # 1.15 Audit Docker files and directories - /usr/bin/docker-runc (Scored)
          it {
            is_expected.to contain_file_line('docker_runc_audit').with(
              'path' => '/etc/audit/rules.d/docker.rules',
              'line' => '-w /usr/bin/docker-runc -k docker'
            )
          }

          it {
            is_expected.to contain_service('auditd').with(
              'ensure'  => 'running',
              'restart' => '/sbin/service auditd restart'
            )
          }
        end
      end
    end
  end

  # 1.2 Use the updated Linux Kernel (Scored)
  context "secure_docker with older kernel" do
    let(:facts) do
      {
        kernelversion: '3.9.10',
      }
    end

    it { is_expected.not_to compile.with_all_deps }
  end
end
