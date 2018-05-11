#This class manages V-1152
#Anonymous access to the registry must be restricted.
class secure_windows::stig::v1152 (
  Boolean $enforced = true,
) {
  if $enforced {
    reg_acl { 'hklm:SYSTEM\\CurrentControlSet\\Control\\SecurePipeServers\\winreg':
      inherit_from_parent => false,
      owner               => 'S-1-5-18',
      permissions         => [
      {
        'RegistryRights'    => 'GENERIC_READ',
        'AccessControlType' => 'Allow',
        'IdentityReference' => 'S-1-5-19',
        'IsInherited'       => false,
        'InheritanceFlags'  => 'ContainerInherit',
        'PropagationFlags'  => 'InheritOnly'
      },
      {
        'RegistryRights'    => 'ReadKey',
        'AccessControlType' => 'Allow',
        'IdentityReference' => 'S-1-5-19',
        'IsInherited'       => false,
        'InheritanceFlags'  => 'None',
        'PropagationFlags'  => 'None'
      },
      {
        'RegistryRights'    => 'GENERIC_ALL',
        'AccessControlType' => 'Allow',
        'IdentityReference' => 'S-1-5-32-544',
        'IsInherited'       => false,
        'InheritanceFlags'  => 'ContainerInherit',
        'PropagationFlags'  => 'InheritOnly'
      },
      {
        'RegistryRights'    => 'FullControl',
        'AccessControlType' => 'Allow',
        'IdentityReference' => 'S-1-5-32-544',
        'IsInherited'       => false,
        'InheritanceFlags'  => 'None',
        'PropagationFlags'  => 'None'
      },
      {
        'RegistryRights'    => 'ReadKey',
        'AccessControlType' => 'Allow',
        'IdentityReference' => 'S-1-5-32-551',
        'IsInherited'       => false,
        'InheritanceFlags'  => 'None',
        'PropagationFlags'  => 'None'
      }],
    }

    }

  }
