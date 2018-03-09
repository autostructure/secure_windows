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
        'identity' => 'NT AUTHORITY\\SYSTEM',
        'rights'   => ['modify'],
        'affects'  => 'self_only'
      },
      {
        'identity' => 'NT AUTHORITY\\SYSTEM',
        'rights'   => ['full'],
        'affects'  => 'children_only'
      },
      {
        'identity' => 'BUILTIN\\Administrators',
        'rights'   => ['modify'],
        'affects'  => 'self_only'
      },
      {
        'identity' => 'BUILTIN\\Administrators',
        'rights'   => ['full'],
        'affects'  => 'children_only'
      },
      {
        'identity' => 'BUILTIN\\Users',
        'rights'   => ['read', 'execute'],
        'affects'  => 'self_only'
      },
      {
        'identity' => 'BUILTIN\\Users',
        'rights'   => ['read', 'execute'],
        'affects'  => 'children_only'
      },
      {
        'identity' => 'CREATOR OWNER',
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

  $system_root = $facts['os']['windows']['system32']

  acl { [ "${system_root}\\winevt\\Logs\\Application.evtx",
          "${system_root}\\winevt\\Logs\\Security.evtx",
          "${system_root}\\winevt\\Logs\\System.evtx"
        ]:
    inherit_parent_permissions => false,
    permissions                => [
      {
        'identity' => 'NT SERVICE\\EventLog',
        'rights'   => ['full'],
        'affects'  => 'self_only',
      },
      {
        'identity' => 'NT AUTHORITY\\SYSTEM',
        'rights'   => ['full'],
        'affects'  => 'self_only',
      },
      {
        'identity' => 'BUILTIN\\Administrators',
        'rights'   => ['full'],
        'affects'  => 'self_only',
      }
    ],
  }

  acl { 'C:\\Windows\\System32\\Eventvwr.exe':
    inherit_parent_permissions => false,
    permissions                => [
      {
        'identity' => 'NT SERVICE\\TrustedInstaller',
        'rights'   => ['full'],
        'affects'  => 'self_only',
      },
      {
        'identity' => 'BUILTIN\\Administrators',
        'rights'   => ['read', 'execute'],
        'affects'  => 'self_only',
      },
      {
        'identity' => 'NT AUTHORITY\\SYSTEM',
        'rights'   => ['read', 'execute'],
        'affects'  => 'self_only',
      },
      {
        'identity' => 'BUILTIN\\Users',
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

  # V-73369 Maintain the permissions on NTDS database and log files
  $ntds_files = union($facts['database_log_files'], [$facts['ntds_parameters']['DSA Database file']])

  acl { $ntds_files:
    group                      => 'S-1-5-18',
    inherit_parent_permissions => true,
    owner                      => 'S-1-5-32-544',
    permissions                => [
      {
        'identity' => 'NT AUTHORITY\\SYSTEM',
        'rights'   => ['full'],
        'affects'  => 'self_only'
      },
      {
        'identity' => 'BUILTIN\\Administrators',
        'rights'   => ['full'],
        'affects'  => 'self_only'
      }
    ],
  }

  # V-73371 The Active Directory SYSVOL directory must have the proper access control permissions.
  $sysvol_mount = regsubst($facts['shares']['SYSVOL'], '^(.+)/sysvol', '\1')

  acl { $sysvol_mount:
    group                      => 'S-1-5-21-429241146-72105815-2897606901-513',
    inherit_parent_permissions => false,
    owner                      => 'S-1-5-32-544',
    permissions                => [
      {
        'identity' => 'NT AUTHORITY\\Authenticated Users',
        'rights'   => ['read', 'execute'],
        'affects'  => 'self_only'
      },
      {
        'identity' => 'NT AUTHORITY\\Authenticated Users',
        'rights'   => ['read', 'execute'],
        'affects'  => 'children_only'
      },
      {
        'identity' => 'BUILTIN\\Server Operators',
        'rights'   => ['read', 'execute'],
        'affects'  => 'self_only'
      },
      {
        'identity' => 'BUILTIN\\Server Operators',
        'rights'   => ['read', 'execute'],
        'affects'  => 'children_only'
      },
      {
        'identity' => 'BUILTIN\\Administrators',
        'rights'   => ['mask_specific'],
        'mask'     => '2032063',
        'affects'  => 'self_only'
      },
      {
        'identity' => 'BUILTIN\\Administrators',
        'rights'   => ['full'],
        'affects'  => 'children_only'
      },
      {
        'identity' => 'NT AUTHORITY\\SYSTEM',
        'rights'   => ['full'],
        'affects'  => 'self_only'
      },
      {
        'identity' => 'NT AUTHORITY\\SYSTEM',
        'rights'   => ['full'],
        'affects'  => 'children_only'
      },
      {
        'identity' => 'BUILTIN\\Administrators',
        'rights'   => ['mask_specific'],
        'mask'     => '2032063',
        'affects'  => 'self_only'
      },
      {
        'identity' => 'CREATOR OWNER',
        'rights'   => ['full'],
        'affects'  => 'children_only'
      }
    ],
  }
}
