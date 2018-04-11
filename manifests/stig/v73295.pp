# This class manages V-73295
# The Telnet Client must not be installed.
class secure_windows::stig::v73295 (
  Boolean $enforced = false,
) {
  if $enforced {
    windowsfeature { 'telnet-client':
      ensure => absent,
    }
  }
}
