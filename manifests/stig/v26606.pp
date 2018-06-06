# This class manages V-26606
# The Telnet service must be disabled if installed.

class secure_windows::stig::v26606 (
  Boolean $enforced = true,
) {
  if $enforced {
    windowsfeature { 'telnet-client':
      ensure => absent,
    }
  }
}
