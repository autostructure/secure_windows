# This class manages V-26600
# The Fax service must be disabled if installed.

class secure_windows::stig::v26600 (
  Boolean $enforced = true,
) {
  if $enforced {
    windowsfeature { 'fax':
      ensure => absent,
    }
  }
}
