# This class manages V-73805
# The Server Message Block (SMB) v1 protocol must be disabled on Windows 2012 R2.
class secure_windows::stig::v73805 (
  Boolean $enforced = true,
) {
  if $enforced {
    windowsfeature { 'fs-smb1':
      ensure => absent,
    }
  }
}
