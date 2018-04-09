# secure_windows::acl
#
# This class manages ACLs
class secure_windows::acl {

  # V-73249
  # Permissions for the system drive root directory (usually C:\) must conform to minimum requirements.
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

  # V-73251
  # Permissions for program file directories must conform to minimum requirements.
  # V-73253
  # Permissions for the Windows installation directory must conform to minimum requirements.
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

  # V-73405
  # Permissions for the Application event log must prevent access by non-privileged accounts.
  # V-73407
  # Permissions for the Security event log must prevent access by non-privileged accounts.
  # V-73409
  # Permissions for the System event log must prevent access by non-privileged accounts.
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
        'identity' => 'S-1-5-18',
        'rights'   => ['full'],
        'affects'  => 'self_only',
      },
      {
        'identity' => 'S-1-5-32-544',
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

  # V-73369 Maintain the permissions on NTDS database and log files

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

  # V-73371 The Active Directory SYSVOL directory must have the proper access control permissions.
  $sysvol_mount = regsubst($facts['shares']['SYSVOL'], '^(.+)/sysvol', '\1')

  acl { $sysvol_mount:
    group                      => 'S-1-5-21-429241146-72105815-2897606901-513',
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
