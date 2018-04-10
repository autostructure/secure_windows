# This class manages:
# V-73249
# Permissions for the system drive root directory (usually C:\) must conform to minimum requirements.
class secure_windows::stig::v73249 (
  Boolean $enforced = false,
) {
  if $enforced {
    acl { 'C:\\':
      inherit_parent_permissions => false,
      permissions                => [
        {
          'identity' => 'S-1-5-18',
          'rights'   => ['full']
        },
        {
          'identity' => 'S-1-5-32-544',
          'rights'   => ['full']
        },
        {
          'identity' => 'S-1-5-32-545',
          'rights'   => ['read', 'execute']
        },
        {
          'identity'    => 'S-1-5-32-545',
          'rights'      => ['mask_specific'],
          'mask'        => '4',
          'child_types' => 'containers'
        },
        {
          'identity'    => 'S-1-5-32-545',
          'rights'      => ['mask_specific'],
          'mask'        => '2',
          'child_types' => 'containers',
          'affects'     => 'children_only'
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
