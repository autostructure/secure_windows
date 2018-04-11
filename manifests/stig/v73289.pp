# This class manages V-73289
# The Microsoft FTP service must not be installed unless required.
class secure_windows::stig::v73289 (
  Boolean $enforced = false,
  Boolean $is_ftp_server = false,
) {
  if $enforced {
    if !$is_ftp_server {
      windowsfeature { 'web-ftp-service':
        ensure => absent,
      }
    }
  }
}
