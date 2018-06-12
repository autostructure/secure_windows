# This class manages V-26070
# Standard user accounts must only have Read permissions to the Winlogon registry key.

class secure_windows::stig::v26070 (
  Boolean $enforced = true,
) {
  if $enforced {

    reg_acl { 'vstriker':
      target              => 'hklm:software\microsoft\windows NT\currentversion\winlogon',
      inherit_from_parent => true,
      owner               => 'S-1-5-18',
      permissions         => [
      {
        'RegistryRights'    => 'ReadKey',
        'AccessControlType' => 'Allow',
        'IdentityReference' => 'S-1-5-32-545',
        'IsInherited'       => false,
        'InheritanceFlags'  => 'ContainerInherit',
        'PropagationFlags'  => 'InheritOnly',
      } ],
    }

  }
}
