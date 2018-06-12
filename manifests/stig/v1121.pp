# This class manages V-1121
# File Transfer Protocol (FTP) servers must be configured to prevent access to the system drive

class secure_windows::stig::v1121 (
  Boolean $enforced = true,
) {

  if $enforced {
    # The fact windows_role returns a comma separated list of role IDs
    # The role ID for FTP Server is 184. We are checking if 184 is in the list
    #   so that these resources only apply to FTP Servers
    if ($facts['windows_role'] and
        $facts['windows_role'] =~ /(^184|,184,|,184$)/) {

      if $facts['ftp_root'] =~ /(^C:\\$|^C:\\Program Files|^C:\\Windows)/ {
        notify { 'Not in compliance with DoD STIG V-73305':
          message  => 'Not in compliance with DoD STIG V-73305. The FTP Server\'s root contains system files.',
          loglevel => warning,
        }
      }
    }
  }
}
