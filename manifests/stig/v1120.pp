# This class manages V-1120
# File Transfer Protocol (FTP) servers must be configured to prevent anonymous logons

class secure_windows::stig::v1120 (
  Boolean $enforced = true,
  Array[String] $ftp_sites = [],
) {

  if $enforced {
    # The fact windows_role returns a comma separated list of role IDs
    # The role ID for FTP Server is 184. We are checking if 184 is in the list
    #   so that these resources only apply to FTP Servers
    if ($facts['windows_role'] and
        $facts['windows_role'] =~ /(^184|,184,|,184$)/) {
      $ftp_sites.each |String $site| {
        # NOTE: - This command does not have a corresponding 'get' command. I would have to parse an XML file.
        #         For now, I will leave it to run this command every time since it is idempotent.
        #       - Really should make this idempotent so it doesn't show an intentional change every 30 min
        #       - This gets applied to each site in the list supplied
        exec { "Set FTP anynymousAuthentication to Disabled on ${site}":
          command => "${facts['system32']}\\inetsrv\\AppCmd.exe set config -section:system.applicationHost/sites /[name='${site}'].ftpServer.security.authentication.anonymousAuthentication.enabled:\"False\" /commit:apphost", # lint:ignore:140chars
        }
      }
    }
  }

}
