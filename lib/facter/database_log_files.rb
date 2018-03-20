Facter.add('database_log_files') do
  confine operatingsystem: :windows
  setcode do
    database_log_files_dir_array = []

    begin
      database_log_files_dir = Facter.value(:ntds_parameters)['DSA Working Directory']
      database_log_files_dir_array = database_log_files_dir.empty? ? '' : Dir["#{database_log_files_dir}/*"]
    rescue
      Puppet.debug 'Facter: database_log_files.rb error occurred.'
    end

    database_log_files_dir_array
  end
end
