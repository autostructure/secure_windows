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
      #cmd_args = []
      #cmd_args << "-G 'http://localhost:8080/pdb/query/v4/event-counts'"
      #cmd_args << "--data-urlencode 'query=[\"~\", \"containing_class\", \"Secure_windows::Stig::[vV]\\d{5}\"]'"
      #cmd_args << "--data-urlencode 'summarize_by=containing_class'"
      #cmd_args << "--data-urlencode 'count_by=certname'"
      #curl_cmd = 'curl'

      #class_array = []
      #data = ''
      cmd_args = {
        "data-urlencode" => "query=[\"~\", \"containing_class\", \"Secure_windows::Stig::[vV]\\d{5}\"]",
      }
      #curl_cmd = 'curl -G http://localhost:8080/pdb/query/v4/event-counts&summarize_by=containing_class&count_by=certname'
      # Puppet::Util::Execution.execute(curl_cmd, cmd_args)



      #curl_cmd = 'curl -G http://localhost:8080/pdb/query/v4/event-counts&summarize_by=containing_class&count_by=certname&query%3D%5B%22~%22%2C%20%22containing_class%22%2C%20%22Secure_windows%3A%3AStig%3A%3A%5BvV%5D%5C%5Cd%7B5%7D%22%5D'
      curl_cmd = 'curl -G http://localhost:8080/pdb/query/v4/event-counts&summarize_by=containing_class&count_by=certname&query=%5B%22~%22%2C%20%22containing_class%22%2C%20%22Secure_windows%3A%3AStig%3A%3A%5BvV%5D.%7B5%7D%22%5D'
      Puppet::Util::Execution.execute(curl_cmd, {})


      #.split("}}")

      #class_array

      #curl_cmd = "curl -G 'http://localhost:8080/pdb/query/v4/event-counts' --data-urlencode 'query=[\"~\", \"containing_class\", \"Secure_windows::Stig::[vV]\\d{5}\"]' --data-urlencode 'summarize_by=containing_class' --data-urlencode 'count_by=certname'"
      #Puppet::Util::Execution.execute(curl_cmd, {})


      # class_array = Facter::Core::Execution.exec(curl_cmd).split("\n")
      # class_array.each do |classname|
        # classname['success'] =
        # classname['failed'] =
        # classname['skipped'] =
      # end
    rescue Exception => e
      "PuppetDB statistics query failed, error message: #{e.message}"
      #"PuppetDB statistics query failed, error message:\n#{e.message}\n#{e.backtrace.inspect}"
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
