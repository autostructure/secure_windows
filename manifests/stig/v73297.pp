# This class manages V-73297
# The TFTP Client must not be installed.
class secure_windows::stig::v73297 (
  Boolean $enforced = false,
) {
  if $enforced {
    windowsfeature { 'tftp-client':
      ensure => absent,
    }
  }
}
