# Puppet server function that reads the appropriate hiera file to
# count the number of vulnerabilities disabled by the user.
#
# dispatch :summary_stats_vulnerabilities_ignored do
#   return_type 'String'
# end

Puppet::Functions.create_function(:statistics_vulnerabilities_disabled) do
  dispatch :no_scope do
    # no arguments
  end

  dispatch :key_value do
    param 'String', :key
  end

  def no_scope
    begin
      scope = closure_scope
      global_scope = scope.find_global_scope
      HieraPuppet.lookup('secure_windows::log::enabled', nil, global_scope, nil, :priority)
      # scope['is_dod']
      # class_scope = scope.class_scope('secure_windows')
      # fqdn = scope['facts']['networking']['fqdn']
      # HieraPuppet.lookup('secure_windows::is_dod', nil, [], nil, :priority)
    rescue
      'Hiera lookup failed.'
    end
  end

  def key_value(key)
    begin
      scope = closure_scope
      HieraPuppet.lookup(key, nil, scope, nil, :priority)
    rescue
      'Hiera lookup failed.'
    end
  end

  # dispatch :supplied_scope do
  #   param 'Class', :scope
  #   # return_type 'String'
  # end
  #
  # def supplied_scope(scope)
  #   hiera_scope = Hiera::Scope.new(scope)
  #   HieraPuppet.lookup('secure_windows::log::enabled', nil, hiera_scope, nil, :priority)
  # end

end
