# This class manages:
# V-73369
# Maintain the permissions on NTDS database and log files
class secure_windows::stig::v73369 (
  Boolean $enforced = false,
) {
  if $enforced {
    if $facts['windows_server_type'] == 'windowsdc' {
      $ntds_files = union($facts['database_log_files'], [$facts['ntds_parameters']['DSA Database file']])

      acl { $ntds_files:
        group                      => 'S-1-5-18',
        inherit_parent_permissions => true,
        owner                      => 'S-1-5-32-544',
        permissions                => [
          {
            'identity' => 'S-1-5-18',
            'rights'   => ['full'],
            'affects'  => 'self_only'
          },
          {
            'identity' => 'S-1-5-32-544',
            'rights'   => ['full'],
            'affects'  => 'self_only'
          }
        ],
      }
    }
  }
}
