# This class manages V-73291
# The Peer Name Resolution Protocol must not be installed.
class secure_windows::stig::v73291 (
  Boolean $enforced = false,
) {
  if $enforced {
    windowsfeature { 'pnrp':
      ensure => absent,
    }
  }
}
