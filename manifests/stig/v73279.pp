# This class manages V-73279
# A host-based firewall must be installed and enabled on the system.
class secure_windows::stig::v73279 (
  Boolean $enforced = false,
) {
  if $enforced {
    class { '::windows_firewall':
      ensure => 'running',
    }
  }
}
