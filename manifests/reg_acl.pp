#
# This class manages registry key ACLs
#
class secure_windows::reg_acl {

  # V-73255
  # Default permissions for the HKEY_LOCAL_MACHINE registry hive must be maintained.

  # Security
  # Let's try this
  # So security is so locked down by default that Puppet can't query it. I don't know a workaround
  # Maybe we can just notify if we can read the values?
  # reg_acl { 'hklm:security\\':
  #   inherit_from_parent => false,
  #   owner               => 'S-1-5-32-544',
  #   permissions         => [
  #   {
  #     'RegistryRights'    => 'FullControl',
  #     'AccessControlType' => 'Allow',
  #     'IdentityReference' => 'S-1-5-18',
  #     'IsInherited'       => false,
  #     'InheritanceFlags'  => 'ContainerInherit',
  #     'PropagationFlags'  => 'None'
  #   },
  #   {
  #     'RegistryRights'    => 'FullControl',
  #     'AccessControlType' => 'Allow',
  #     'IdentityReference' => 'S-1-5-32-544',
  #     'IsInherited'       => false,
  #     'InheritanceFlags'  => 'ContainerInherit',
  #     'PropagationFlags'  => 'None'
  #   }],
  # }

  # registry::value { 'v73495':
  #   key   => 'HKEY_LOCAL_MACHINE\SECURITY',
  #   value => 'test',
  #   type  => 'dword',
  #   data  => '0x00000000',
  # }


  # Software
  reg_acl { 'hklm:software\\':
    inherit_from_parent => false,
    owner               => 'S-1-5-32-544',
    permissions         => [
    {
      'RegistryRights'    => 'FullControl',
      'AccessControlType' => 'Allow',
      'IdentityReference' => 'S-1-3-0',
      'IsInherited'       => false,
      'InheritanceFlags'  => 'ContainerInherit',
      'PropagationFlags'  => 'None'
    },
    {
      'RegistryRights'    => 'FullControl',
      'AccessControlType' => 'Allow',
      'IdentityReference' => 'S-1-5-18',
      'IsInherited'       => false,
      'InheritanceFlags'  => 'ContainerInherit',
      'PropagationFlags'  => 'None'
    },
    {
      'RegistryRights'    => 'FullControl',
      'AccessControlType' => 'Allow',
      'IdentityReference' => 'S-1-5-32-544',
      'IsInherited'       => false,
      'InheritanceFlags'  => 'ContainerInherit',
      'PropagationFlags'  => 'None'
    },
    {
      'RegistryRights'    => 'ReadKey',
      'AccessControlType' => 'Allow',
      'IdentityReference' => 'S-1-5-32-545',
      'IsInherited'       => false,
      'InheritanceFlags'  => 'ContainerInherit',
      'PropagationFlags'  => 'None'
    },
    {
      'RegistryRights'    => 'ReadKey',
      'AccessControlType' => 'Allow',
      'IdentityReference' => 'S-1-15-2-1',
      'IsInherited'       => false,
      'InheritanceFlags'  => 'ContainerInherit',
      'PropagationFlags'  => 'None'
    }],
  }

  # System
  reg_acl { 'hklm:system\\':
    inherit_from_parent => false,
    owner               => 'S-1-5-32-544',
    permissions         => [
    {
      'RegistryRights'    => 'GENERIC_ALL',
      'AccessControlType' => 'Allow',
      'IdentityReference' => 'S-1-3-0',
      'IsInherited'       => false,
      'InheritanceFlags'  => 'ContainerInherit',
      'PropagationFlags'  => 'InheritOnly'
    },
    {
      'RegistryRights'    => 'GENERIC_ALL',
      'AccessControlType' => 'Allow',
      'IdentityReference' => 'S-1-5-18',
      'IsInherited'       => false,
      'InheritanceFlags'  => 'ContainerInherit',
      'PropagationFlags'  => 'InheritOnly'
    },
    {
      'RegistryRights'    => 'FullControl',
      'AccessControlType' => 'Allow',
      'IdentityReference' => 'S-1-5-18',
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
      'RegistryRights'    => 'GENERIC_READ',
      'AccessControlType' => 'Allow',
      'IdentityReference' => 'S-1-5-32-545',
      'IsInherited'       => false,
      'InheritanceFlags'  => 'ContainerInherit',
      'PropagationFlags'  => 'InheritOnly'
    },
    {
      'RegistryRights'    => 'ReadKey',
      'AccessControlType' => 'Allow',
      'IdentityReference' => 'S-1-5-32-545',
      'IsInherited'       => false,
      'InheritanceFlags'  => 'None',
      'PropagationFlags'  => 'None'
    },
    {
      'RegistryRights'    => 'ReadKey',
      'AccessControlType' => 'Allow',
      'IdentityReference' => 'S-1-15-2-1',
      'IsInherited'       => false,
      'InheritanceFlags'  => 'None',
      'PropagationFlags'  => 'None'
    },
    {
      'RegistryRights'    => 'GENERIC_READ',
      'AccessControlType' => 'Allow',
      'IdentityReference' => 'S-1-15-2-1',
      'IsInherited'       => false,
      'InheritanceFlags'  => 'ContainerInherit',
      'PropagationFlags'  => 'InheritOnly'
    }],
  }

}
