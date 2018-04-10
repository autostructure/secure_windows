# This class manages:
# V-73251
# Permissions for program file directories must conform to minimum requirements.
# V-73253
# Permissions for the Windows installation directory must conform to minimum requirements.
class secure_windows::stig::v73251 (
  Boolean $enforced = false,
) {
  if $enforced {
    acl { ['C:\\Program Files', 'C:\\Program Files (x86)', 'C:\\Windows']:
      inherit_parent_permissions => false,
      permissions                => [
        {
          'identity' => 'NT SERVICE\\TrustedInstaller',
          'rights'   => ['full'],
          'affects'  => 'self_only'
        },
        {
          'identity'    => 'NT SERVICE\\TrustedInstaller',
          'rights'      => ['full'],
          'child_types' => 'containers',
          'affects'     => 'children_only'
        },
        {
          'identity' => 'S-1-5-18',
          'rights'   => ['modify'],
          'affects'  => 'self_only'
        },
        {
          'identity' => 'S-1-5-18',
          'rights'   => ['full'],
          'affects'  => 'children_only'
        },
        {
          'identity' => 'S-1-5-32-544',
          'rights'   => ['modify'],
          'affects'  => 'self_only'
        },
        {
          'identity' => 'S-1-5-32-544',
          'rights'   => ['full'],
          'affects'  => 'children_only'
        },
        {
          'identity' => 'S-1-5-32-545',
          'rights'   => ['read', 'execute'],
          'affects'  => 'self_only'
        },
        {
          'identity' => 'S-1-5-32-545',
          'rights'   => ['read', 'execute'],
          'affects'  => 'children_only'
        },
        {
          'identity' => 'S-1-3-0',
          'rights'   => ['full'],
          'affects'  => 'children_only'
        },
        {
          'identity' => 'S-1-15-2-1',
          'rights'   => ['read', 'execute'],
          'affects'  => 'self_only'
        },
        {
          'identity' => 'S-1-15-2-1',
          'rights'   => ['read', 'execute'],
          'affects'  => 'children_only'
        },
        {
          'identity' => 'S-1-15-2-2',
          'rights'   => ['read', 'execute'],
          'affects'  => 'self_only'
        },
        {
          'identity' => 'S-1-15-2-2',
          'rights'   => ['read', 'execute'],
          'affects'  => 'children_only'
        },
      ],
    }
  }
}
