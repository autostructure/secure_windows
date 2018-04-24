# Puppet server function that reads the appropriate hiera file to
# count the number of vulnerabilities disabled by the user.
#
# dispatch :summary_stats_vulnerabilities_ignored do
#   return_type 'String'
# end

Puppet::Functions.create_function(:summary_stats_vulnerabilities_ignored) do
  dispatch :summary_stats_vulnerabilities_ignored do
    # no arguments
  end

  def summary_stats_vulnerabilities_ignored
    # scope = closure_scope
    scope = Puppet::Parser::Scope.enclosing_scope
    fqdn = scope['facts']['networking']['fqdn']
    Puppet.debug "summary_stats_vulnerabilites_ignored: #{fqdn}"
    fqdn
    # HieraPuppet.lookup('secure_windows::is_dod', nil, scope, nil, :priority)

    # works...
    # HieraPuppet.lookup('secure_windows::is_dod', nil, [], nil, :priority)
    # test closure_scope...
  end
end
