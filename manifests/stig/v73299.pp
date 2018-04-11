# This class manages V-73299
# The Server Message Block (SMB) v1 protocol must be uninstalled.
class secure_windows::stig::v73299 (
  Boolean $enforced = false,
) {
  if $enforced {
    windowsfeature { 'fs-smb1':
      ensure => absent,
    }
  }
}
