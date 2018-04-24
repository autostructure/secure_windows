# Puppet server function that reads the appropriate hiera file to
# count the number of vulnerabilities disabled by the user.
#
# dispatch :summary_stats_vulnerabilities_ignored do
#   return_type 'String'
# end

Puppet::Functions.create_function(:summary_stats_vulnerabilities_ignored) do
  def summary_stats_vulnerabilities_ignored
    Puppet.debug 'summary_stats_vulnerabilites_ignored.rb ...'
    # hiera_lookup_value2 = HieraPuppet.lookup('secure_windows::stig::', false, [], nil, :priority)
    HieraPuppet.lookup('secure_windows::is_dod', nil, [], nil, :priority)
  end
end
