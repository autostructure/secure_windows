# This class manages V-40177
# Permissions for program file directories must conform to minimum requirements.
class secure_windows::stig::v40177 (
  Boolean $enforced = true,
) {
  if $enforced {
    acl { ['C:\\Program Files', 'C:\\Program Files (x86)']:
      inherit_parent_permissions => false,
      permissions                => [
        {
          'identity' => 'NT SERVICE\TrustedInstaller',
          'rights'   => ['full'],
          'affects'  => 'self_only'
        },
        {
          'identity'    => 'NT SERVICE\TrustedInstaller',
          'rights'      => ['full'],
          'child_types' => 'containers',
          'affects'     => 'children_only'
        },
        {
          'identity' => 'NT AUTHORITY\SYSTEM',
          'rights'   => ['modify'],
          'affects'  => 'self_only'
        },
        {
          'identity' => 'NT AUTHORITY\SYSTEM',
          'rights'   => ['full'],
          'affects'  => 'children_only'
        },
        {
          'identity' => 'BUILTIN\Administrators',
          'rights'   => ['modify'],
          'affects'  => 'self_only'
        },
        {
          'identity' => 'BUILTIN\Administrators',
          'rights'   => ['full'],
          'affects'  => 'children_only'
        },
        {
          'identity' => 'BUILTIN\Users',
          'rights'   => ['read', 'execute'],
          'affects'  => 'self_only'
        },
        {
          'identity' => 'BUILTIN\Users',
          'rights'   => ['read', 'execute'],
          'affects'  => 'children_only'
        },
        {
          'identity' => 'CREATOR OWNER',
          'rights'   => ['full'],
          'affects'  => 'children_only'
        },
        {
          'identity' => 'ALL APPLICATION PACKAGES',
          'rights'   => ['read', 'execute'],
          'affects'  => 'self_only'
        },
        {
          'identity' => 'ALL APPLICATION PACKAGES',
          'rights'   => ['read', 'execute'],
          'affects'  => 'children_only'
        }
      ],
    }
  }
}
