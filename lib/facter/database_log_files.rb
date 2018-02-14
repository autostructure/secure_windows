Facter.add('database_log_files') do
  confine kernel: 'windows'

  setcode do
    database_log_files_dir = Facter.value(:ntds_parameters)['DSA Working Directory']

    database_log_files_dir_array = Dir["#{database_log_files_dir}/*"]

    database_log_files_dir_array
  end
end
