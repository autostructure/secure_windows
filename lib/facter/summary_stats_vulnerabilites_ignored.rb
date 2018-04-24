# summary_stats_vulnerabilites_ignored.rb
# Puppet fact the reads the appropriate hiera data file to
# count the number of vulnerabilities disabled by the user.
#
# @See https://rubygems.org/gems/hiera-puppet/versions/1.0.0
# Gemfile installation (may come packaged with Puppet).
# gem 'hiera-puppet', '~> 1.0'
# gem install hiera-puppet
#

# >cmd /c "set a=%TIME% & puppet agent -t & facter -p & echo Start Time = %a% & echo End Time = %TIME%"
# Warning: Downgrading to PSON for future requests
# Notice: Local environment: 'production' doesn't match server specified node environment 'jeffwin', swi
# tching agent to 'jeffwin'.
# Info: Retrieving pluginfacts
# Info: Retrieving plugin
# Info: Loading facts
# Error: Facter: error while resolving custom fact "summary_stats_vulnerabilites_ignored": v5 hiera.yaml
#  is only to be used inside an environment or a module and cannot be given to the global hiera
# Error: Could not retrieve catalog from remote server: Error 500 on SERVER: Server Error: Evaluation Er
# ror: Error while evaluating a Function Call, Windows Server 2012 R2 not yet supported. at /etc/puppetl
# abs/code/environments/jeffwin/modules/secure_windows/manifests/init.pp:13:7 on node win-jeff-007
# Warning: Not using cache on failed catalog
# Error: Could not retrieve catalog; skipping run
# 2018-04-24 08:49:16.452605 ERROR puppetlabs.facter - error while resolving custom fact "summary_stats_
# vulnerabilites_ignored": v5 hiera.yaml is only to be used inside an environment or a module and cannot
#  be given to the global hiera
# aio_agent_build => 5.4.0
# aio_agent_version => 5.4.0
# archive_windir => C:\ProgramData\staging
# choco_install_path => C:\ProgramData\chocolatey
# chocolateyversion => 0.10.8
# common_appdata => C:\ProgramData
# credential_guard_requiredsecurityproperties => unconfigured
# credential_guard_virtualizationbasedsecuritystatus => not running
# database_log_files => []


# ******************************************************************************
# Try puppet function (because hiera reside in an environment or module).
# ******************************************************************************
#
# require 'hiera_puppet'
# include HieraPuppet
Facter.add(:summary_stats_vulnerabilites_ignored) do
  confine operatingsystem: :windows

  setcode do
    Puppet.debug 'summary_stats_vulnerabilites_ignored.rb ...'
    hiera_lookup_value = HieraPuppet.lookup('secure_windows::is_dod', false, [], nil, :priority)
    #Puppet.debug hiera_lookup_value
    hiera_lookup_value
  end

end
