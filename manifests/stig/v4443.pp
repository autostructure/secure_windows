# This class manages V-4443
# Unauthorized remotely accessible registry paths and sub-paths must not be configured.
class secure_windows::stig::v4443 (
  Boolean $enforced = true,
) {
  if $enforced {
    $allowed_paths = [
      'Software\\Microsoft\\OLAP Server',
      'Software\\Microsoft\\Windows NT\\CurrentVersion\\Perflib',
      'Software\\Microsoft\\Windows NT\\CurrentVersion\\Print',
      'Software\\Microsoft\\Windows NT\\CurrentVersion\\Windows',
      'System\\CurrentControlSet\\Control\\ContentIndex',
      'System\\CurrentControlSet\\Control\\Print\\Printers',
      'System\\CurrentControlSet\\Control\\Terminal Server',
      'System\\CurrentControlSet\\Control\\Terminal Server\\UserConfig',
      'System\\CurrentControlSet\\Control\\Terminal Server\\DefaultUserConfiguration',
      'System\\CurrentControlSet\\Services\\Eventlog',
      'System\\CurrentControlSet\\Services\\Sysmonlog',
    ]

    registry::value { 'v4443':
      key   => 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\SecurePipeServers\Winreg\AllowedPaths',
      value => 'Machine',
      type  => 'array',
      data  => $allowed_paths,
    }
  }
}
