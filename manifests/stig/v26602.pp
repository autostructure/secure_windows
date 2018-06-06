# This class manages V-26602
# The Microsoft FTP service must not be installed unless required.

class secure_windows::stig::v26602 (
  Boolean $enforced = true,
) {
  if $enforced {
    windowsfeature { 'web-ftp-service':
      ensure => absent,
    }
  }
}
