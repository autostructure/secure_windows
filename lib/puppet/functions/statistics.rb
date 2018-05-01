# Puppet server function that reads the appropriate hiera file to
# count the number of vulnerabilities disabled by the user.
#
# dispatch :summary_stats_vulnerabilities_ignored do
#   return_type 'String'
# end

Puppet::Functions.create_function(:statistics) do
  dispatch :no_args do
    # no arguments
  end

  # dispatch :certname_param do
  #   param 'String', :certname
  # end

  def no_args
    begin
      curl_cmd = "curl -G 'http://localhost:8080/pdb/query/v4/event-counts' --data-urlencode 'query=[\"~\", \"containing_class\", \"Secure_windows::Stig::[vV]\\d{5}\"]' --data-urlencode 'summarize_by=containing_class' --data-urlencode 'count_by=certname'"
      class_summary = Facter::Core::Execution.exec(curl_cmd)
      # class_array = Facter::Core::Execution.exec(curl_cmd).split("\n")
      # class_array.each do |classname|
        # classname['success'] =
        # classname['failed'] =
        # classname['skipped'] =
      # end
      class_summary
    rescue Exception => e
      "PuppetDB statistics query failed, error message:\n#{e.message}\n#{e.backtrace.inspect}"
    end
  end

  def certname_param(key)
    begin
      #
    rescue Exception => e
      "PuppetDB statistics query failed, error message: #{e.class.name}\n#{e.message}\n#{e.backtrace.inspect}"
    end
  end

end
