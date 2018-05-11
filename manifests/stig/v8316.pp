# This class manages V-8316
# Active Directory data files must have proper access control permissions.
class secure_windows::stig::v8316 (
  Boolean $enforced = true,
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
