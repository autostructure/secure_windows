# This class manages V-36680
# Access to the Windows Store must be turned off.
class secure_windows::stig::v36680 (
  Boolean $enforced = true,
) {
  if $enforced {
    windowsfeature { 'desktop-experience':
      ensure => absent,
    }
  }
}
