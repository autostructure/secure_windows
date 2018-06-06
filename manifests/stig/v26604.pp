# This class manages V-26604
#  The Peer Networking Identity Manager service must be disabled if installed.

class secure_windows::stig::v26604 (
  Boolean $enforced = true,
) {
  if $enforced {
    windowsfeature { 'p2pimsvc':
      ensure => absent,
    }
  }
}
