# This class manages:
# V-73375
# The Active Directory Domain Controllers Organizational Unit (OU) object must have the proper access control permissions.
# V-73395
# The Active Directory Domain Controllers Organizational Unit (OU) object must be configured with proper audit settings.
class secure_windows::stig::v73395 (
  Boolean $enforced = false,
) {
  if $enforced {
    if $facts['windows_server_type'] == 'windowsdc' {
      $root_domain = $facts['root_domain']

      ad_acl { "OU=Domain Controllers,${root_domain}":
        audit_rules  => [
          {
            'ad_rights'        => 'WriteDacl',
            'identity'         => 'S-1-1-0',
            'audit_flags'      => 'Success',
            'inheritance_type' => 'None',
          },
          {
            'ad_rights'        => 'WriteProperty',
            'identity'         => 'S-1-1-0',
            'audit_flags'      => 'Success',
            'inheritance_type' => 'All',
          },
          {
            'ad_rights'        => 'GenericAll',
            'identity'         => 'S-1-1-0',
            'audit_flags'      => 'Failure',
            'inheritance_type' => 'None',
          },
        ],
        access_rules => [
        {
          'identity'            => 'S-1-5-9',
          'ad_rights'           => 'GenericRead',
          'access_control_type' => 'Allow',
          'inheritance_type'    => 'None'
        },
        {
          'identity'            => 'S-1-5-11',
          'ad_rights'           => 'GenericRead',
          'access_control_type' => 'Allow',
          'inheritance_type'    => 'None'
        },
        {
          'identity'            => 'S-1-5-18',
          'ad_rights'           => 'GenericAll',
          'access_control_type' => 'Allow',
          'inheritance_type'    => 'None'
        },
        {
          'identity'            => "${facts['domain_sid']}-512",
          'ad_rights'           => 'CreateChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner',
          'access_control_type' => 'Allow',
          'inheritance_type'    => 'None'
        }],
      }
    }
  }
}
