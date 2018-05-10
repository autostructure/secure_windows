# This class manages V-42420
# A host-based firewall must be installed and enabled on the system.
class secure_windows::stig::v42420 (
  Boolean $enforced = true,
) {
  if $enforced {
    class { '::windows_firewall':
      ensure => 'running',
    }
  }
}
