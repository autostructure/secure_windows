# This class manages V-73293
# Simple TCP/IP Services must not be installed.
class secure_windows::stig::v73293 (
  Boolean $enforced = false,
) {
  if $enforced {
    windowsfeature { 'simple-tcpip':
      ensure => absent,
    }
  }
}
