# This class manages V-26605
# The Simple TCP/IP Services service must be disabled if installed.

class secure_windows::stig::v26605 (
  Boolean $enforced = true,
) {
  if $enforced {
    windowsfeature { 'simple-tcpip':
      ensure => absent,
    }
  }
}
