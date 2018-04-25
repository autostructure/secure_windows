# Puppet server function that reads the appropriate hiera file to
# count the number of vulnerabilities disabled by the user.
#
# dispatch :summary_stats_vulnerabilities_ignored do
#   return_type 'String'
# end

Puppet::Functions.create_function(:summary_stats_vulnerabilities_ignored) do
  dispatch :no_scope do
    # no arguments
  end

  dispatch :supplied_scope do
    param 'Class', :scope
    # return_type 'String'
  end

  def no_scope
    scope = closure_scope
    #HieraPuppet.lookup('secure_windows::log::enabled', nil, scope, nil, :priority)
    #scope['enabled']
    scope['is_dod']
    # class_scope = scope.class_scope('secure_windows')
    # fqdn = scope['facts']['networking']['fqdn']
    # HieraPuppet.lookup('secure_windows::is_dod', nil, [], nil, :priority)
  end

  def supplied_scope(scope)
    hiera_scope = Hiera::Scope.new(scope)
    HieraPuppet.lookup('secure_windows::log::enabled', nil, hiera_scope, nil, :priority)
  end

end
