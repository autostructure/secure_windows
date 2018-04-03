# This class manages settings for FTP servers
class secure_windows::ftp_servers {

  # The fact windows_role returns a comma separated list of role IDs
  # The role ID for FTP Server is 184. We are checking if 184 is in the list
  #   so that these resources only apply to FTP Servers
  if ($facts['windows_role'] and
      $facts['windows_role'] =~ /(^184|,184,|,184$)/) {

    # V-73303
    # FTP servers must be configured to prevent anonymous logons.
    #
    # NOTE: - This command does not have a corresponding 'get' command. I would have to parse an XML file.
    #         For now, I will leave it to run this command every time since it is idempotent.
    #       - Really should make this idempotent so it doesn't show an intentional change every 30 min
    #       - This only works for servers who's FTP server site is the same as the FQDN. A server could
    #         create an IIS FTP Server at a different address and we would not know about it.
    exec { 'Set FTP anynymousAuthentication to Disabled':
      command => "${facts['system32']}\\inetsrv\\AppCmd.exe set config -section:system.applicationHost/sites /[name='${facts['fqdn']}'].ftpServer.security.authentication.anonymousAuthentication.enabled:\"False\" /commit:apphost",
    }

    # V-73305
    # FTP servers must be configured to prevent access to the system drive.
    if $facts['ftp_root'] =~ /(^C:\\$|^C:\\Program Files|^C:\\Windows)/ {
      notify { 'Not in compliance with DoD STIG V-73305':
        message  => 'Not in compliance with DoD STIG V-73305. The FTP Server\'s root contains system files.',
        loglevel => warning,
      }
    }
  }
}
