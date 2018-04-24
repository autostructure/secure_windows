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
    Puppet.debug 'summary_stats_vulnerabilites_ignored.rb ...'
    hiera_lookup_value = HieraPuppet.lookup('secure_windows::is_dod', false, [], nil, :priority)
    Puppet.debug hiera_lookup_value
    hiera_lookup_value
  end

end
