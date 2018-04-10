# This class manages V-73301
# Windows PowerShell 2.0 must not be installed.
class secure_windows::stig::v73301 (
  Boolean $enforced = false,
) {
  if $enforced {
    windowsfeature { 'powershell-v2':
      ensure => absent,
    }
  }
}
