require 'beaker-rspec/spec_helper'
require 'beaker-rspec/helpers/serverspec'
require 'beaker/puppet_install_helper'

run_puppet_install_helper unless ENV['BEAKER_provision'] == 'no'

RSpec.configure do |c|
  # Project root
  proj_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))

  # Readable test descriptions
  c.formatter = :documentation

  # Configure all nodes in nodeset
  c.before :suite do
    # Install module and dependencies
    puppet_module_install(source: proj_root, module_name: 'secure_docker')
    hosts.each do |host|
      on host, puppet('module', 'install', 'puppetlabs-stdlib'), acceptable_exit_codes: [0, 1]
      on host, puppet('module', 'install', 'puppet-module-epel'), acceptable_exit_codes: [0, 1]
      on host, puppet('module', 'install', 'puppetlabs-docker_platform'), acceptable_exit_codes: [0, 1]
      on host, puppet('module', 'install', 'garethr-docker', '--version', '5.2.0'), acceptable_exit_codes: [0, 1]
    end
  end
end
