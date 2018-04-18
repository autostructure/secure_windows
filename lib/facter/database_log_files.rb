# This fact returns an array of all directories under $facts['ntds_parameters']['DSA Working Directory']
#
# Example:
# if $facts['ntds_parameters']['DSA Working Directory'] is C:/Windows/NTDS
# database_log_files will return [ "C:/Windows/NTDS/Api.chk",
#                                  "C:/Windows/NTDS/Api.log",
#                                  "C:/Windows/NTDS/Api00001.log",
#                                  "C:/Windows/NTDS/Apires00001.jrs",
#                                  "C:/Windows/NTDS/Apires00002.jrs",
#                                  "C:/Windows/NTDS/Apitmp.log",
#                                  "C:/Windows/NTDS/edb.chk",
#                                  "C:/Windows/NTDS/edb.log",
#                                  "C:/Windows/NTDS/edbres00001.jrs",
#                                  "C:/Windows/NTDS/edbres00002.jrs",
#                                  "C:/Windows/NTDS/edbtmp.log",
#                                  "C:/Windows/NTDS/ntds.dit",
#                                  "C:/Windows/NTDS/ntds.jfm",
#                                  "C:/Windows/NTDS/temp.edb"
#                                ]
#
# This only applies on Domain Controllers
#
Facter.add('database_log_files') do
  confine operatingsystem: :windows
  setcode do
    database_log_files_dir_array = []

    begin
      database_log_files_dir = Facter.value(:ntds_parameters)['DSA Working Directory']
      database_log_files_dir_array = database_log_files_dir.empty? ? '' : Dir["#{database_log_files_dir}/*"]
    rescue StandardError => e
      Puppet.debug "Facter: database_log_files.rb error occurred: #{e}"
    end

    database_log_files_dir_array
  end
end
