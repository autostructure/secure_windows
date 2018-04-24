# summary_stats_vulnerabilites_ignored.rb
# Puppet fact the reads the appropriate hiera data file to
# count the number of vulnerabilities disabled by the user.
#
# @See https://rubygems.org/gems/hiera-puppet/versions/1.0.0
# Gemfile installation (may come packaged with Puppet).
# gem 'hiera-puppet', '~> 1.0'
# gem install hiera-puppet
#
require 'hiera-puppet'
#include REXML
Facter.add(:summary_stats_vulnerabilites_ignored) do
  confine operatingsystem: :windows

  setcode do
    hiera_backend = Hiera::Backend::Puppet_backend.initialize
    # hiera_scope = Hiera::Scope.initialize(hiera_backend)
    hiera_backend
  end

end
