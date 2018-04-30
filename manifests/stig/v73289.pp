# This class manages V-73289
# The Microsoft FTP service must not be installed unless required.
class secure_windows::stig::v73289 (
  Boolean $enforced = false,
) {
  if $enforced {
    windowsfeature { 'web-ftp-service':
      ensure => absent,
    }
  }
}
