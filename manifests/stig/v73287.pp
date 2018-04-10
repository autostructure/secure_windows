# This class manages V-73287
# The Fax Server role must not be installed.
class secure_windows::stig::v73287 (
  Boolean $enforced = false,
) {
  if $enforced {
    windowsfeature { 'fax':
      ensure => absent,
    }
  }
}
