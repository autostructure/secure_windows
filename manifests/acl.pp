# secure_windows::acl
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include secure_windows::acl
class secure_windows::acl {
  acl { 'C:\\':
    inherit_parent_permissions => false,
    permissions                => [
      {
        'identity' => 'NT AUTHORITY\\SYSTEM',
        'rights'   => ['full']
      },
      {
        'identity' => 'BUILTIN\\Administrators',
        'rights'   => ['full']
      },
      {
        'identity' => 'BUILTIN\\Users',
        'rights'   => ['read', 'execute']
      },
      {
        'identity'    => 'BUILTIN\\Users',
        'rights'      => ['mask_specific'],
        'mask'        => '4',
        'child_types' => 'containers'
      },
      {
        'identity'    => 'BUILTIN\\Users',
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

  acl { 'C:\\Program Files':
    inherit_parent_permissions => false,
    permissions                => [
      {
        'identity' => 'NT SERVICE\\TrustedInstaller',
        'rights'   => ['full'],
        'affects'  => 'self_only'},
      {
        'identity'    => 'NT SERVICE\\TrustedInstaller',
        'rights'      => ['full'],
        'child_types' => 'containers',
        'affects'     => 'children_only'},
      {
        'identity' => 'NT AUTHORITY\\SYSTEM',
        'rights'   => ['modify'],
        'affects'  => 'self_only'},
      {
        'identity' => 'NT AUTHORITY\\SYSTEM',
        'rights'   => ['full'],
        'affects'  => 'children_only'},
      {
        'identity' => 'BUILTIN\\Administrators',
        'rights'   => ['modify'],
        'affects'  => 'self_only'},
      {
        'identity' => 'BUILTIN\\Administrators',
        'rights'   => ['full'],
        'affects'  => 'children_only'},
      {
        'identity' => 'BUILTIN\\Users',
        'rights'   => ['read', 'execute'],
        'affects'  => 'self_only'},
      {
        'identity' => 'BUILTIN\\Users',
        'rights'   => ['read', 'execute'],
        'affects'  => 'children_only'},
      {
        'identity' => 'CREATOR OWNER',
        'rights'   => ['full'],
        'affects'  => 'children_only'},
      {
        'identity' => 'APPLICATION PACKAGE AUTHORITY\\ALL APPLICATION PACKAGES',
        'rights'   => ['read', 'execute'],
        'affects'  => 'self_only'},
      {
        'identity' => 'APPLICATION PACKAGE AUTHORITY\\ALL APPLICATION PACKAGES',
        'rights'   => ['read', 'execute'],
        'affects'  => 'children_only'},
      {
        'identity' => 'APPLICATION PACKAGE AUTHORITY\\ALL RESTRICTED APPLICATION PACKAGES',
        'rights'   => ['read', 'execute'],
        'affects'  => 'self_only'},
      {
        'identity' => 'APPLICATION PACKAGE AUTHORITY\\ALL RESTRICTED APPLICATION PACKAGES',
        'rights'   => ['read', 'execute'],
        'affects'  => 'children_only'}
    ],
  }
}
