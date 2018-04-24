# Puppet server function that reads the appropriate hiera file to
# count the number of vulnerabilities disabled by the user.

Puppet::Functions.create_function(:'secure_windows::vulnerabilities_ignored') do
  dispatch :vulnerabilities_ignored do
    return_type 'String'
  end

  def vulnerabilities_ignored
    Puppet.notice 'summary_stats_vulnerabilites_ignored.rb ...'
    # hiera_lookup_value2 = HieraPuppet.lookup('secure_windows::stig::', false, [], nil, :priority)
    HieraPuppet.lookup('secure_windows::is_dod', false, [], nil, :priority)
  end
end
