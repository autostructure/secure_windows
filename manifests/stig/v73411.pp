# This class manages:
# V-73411
# Event Viewer must be protected from unauthorized modification and deletion.
class secure_windows::stig::v73411 (
  Boolean $enforced = false,
) {
  if $enforced {
    acl { 'C:\\Windows\\System32\\Eventvwr.exe':
      inherit_parent_permissions => false,
      permissions                => [
        {
          'identity' => 'NT SERVICE\\TrustedInstaller',
          'rights'   => ['full'],
          'affects'  => 'self_only',
        },
        {
          'identity' => 'S-1-5-32-544',
          'rights'   => ['read', 'execute'],
          'affects'  => 'self_only',
        },
        {
          'identity' => 'S-1-5-18',
          'rights'   => ['read', 'execute'],
          'affects'  => 'self_only',
        },
        {
          'identity' => 'S-1-5-32-545',
          'rights'   => ['read', 'execute'],
          'affects'  => 'self_only',
        },
        {
          'identity' => 'S-1-15-2-1',
          'rights'   => ['read', 'execute'],
          'affects'  => 'self_only',
        },
        {
          'identity' => 'S-1-15-2-2',
          'rights'   => ['read', 'execute'],
          'affects'  => 'self_only',
        }
      ],
    }
  }
}
