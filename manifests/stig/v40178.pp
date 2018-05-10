# This class manages V-40178
# Permissions for system drive root directory (usually C:\) must conform to minimum requirements.
class secure_windows::stig::v40178 (
  Boolean $enforced = true,
) {
  if $enforced {
    acl { 'C:\\':
      inherit_parent_permissions => false,
      permissions                => [
        {
          'identity' => 'NT AUTHORITY\SYSTEM',
          'rights'   => ['full']
        },
        {
          'identity' => 'BUILTIN\Administrators',
          'rights'   => ['full']
        },
        {
          'identity' => 'BUILTIN\Users',
          'rights'   => ['read', 'execute']
        },
        {
          'identity'    => 'BUILTIN\Users',
          'rights'      => ['mask_specific'],
          'mask'        => '4',
          'child_types' => 'containers'
        },
        {
          'identity'    => 'BUILTIN\Users',
          'rights'      => ['mask_specific'],
          'mask'        => '2',
          'child_types' => 'containers',
          'affects'     => 'children_only'
        },
        {
          'identity' => 'CREATOR OWNER',
          'rights'   => ['full'],
          'affects'  => 'children_only'
        }
      ],
    }
  }
}
