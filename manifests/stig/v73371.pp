# This class manages:
# V-73371
# The Active Directory SYSVOL directory must have the proper access control permissions.
class secure_windows::stig::v73371 (
  Boolean $enforced = false,
) {
  if $enforced {
    if $facts['windows_server_type'] == 'windowsdc' {
      $sysvol_mount = regsubst($facts['shares']['SYSVOL'], '^(.+)/sysvol', '\1')

      acl { $sysvol_mount:
        group                      => 'S-1-5-32-544',
        inherit_parent_permissions => false,
        owner                      => 'S-1-5-32-544',
        permissions                => [
          {
            'identity' => 'S-1-5-11',
            'rights'   => ['read', 'execute'],
            'affects'  => 'self_only'
          },
          {
            'identity' => 'S-1-5-11',
            'rights'   => ['read', 'execute'],
            'affects'  => 'children_only'
          },
          {
            'identity' => 'S-1-5-32-549',
            'rights'   => ['read', 'execute'],
            'affects'  => 'self_only'
          },
          {
            'identity' => 'S-1-5-32-549',
            'rights'   => ['read', 'execute'],
            'affects'  => 'children_only'
          },
          {
            'identity' => 'S-1-5-32-544',
            'rights'   => ['mask_specific'],
            'mask'     => '2032063',
            'affects'  => 'self_only'
          },
          {
            'identity' => 'S-1-5-32-544',
            'rights'   => ['full'],
            'affects'  => 'children_only'
          },
          {
            'identity' => 'S-1-5-18',
            'rights'   => ['full'],
            'affects'  => 'self_only'
          },
          {
            'identity' => 'S-1-5-18',
            'rights'   => ['full'],
            'affects'  => 'children_only'
          },
          {
            'identity' => 'S-1-5-32-544',
            'rights'   => ['mask_specific'],
            'mask'     => '2032063',
            'affects'  => 'self_only'
          },
          {
            'identity' => 'S-1-3-0',
            'rights'   => ['full'],
            'affects'  => 'children_only'
          }
        ],
      }
    }
  }
}
