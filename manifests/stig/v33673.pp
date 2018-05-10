# This class manages V-33673
# Active Directory Group Policy objects must have proper access control permissions.
class secure_windows::stig::v33673 (
  Boolean $enforced = true,
) {
  if $enforced {
    if $facts['windows_server_type'] == 'windowsdc' {
      $root_domain = $facts['root_domain']
      ad_acl { "CN=Policies,CN=System,${root_domain}":
        audit_rules  => [
          {
            'ad_rights'        => 'WriteProperty, WriteDacl',
            'identity'         => 'S-1-1-0',
            'audit_flags'      => 'Success',
            'inheritance_type' => 'Descendents',
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
          'ad_rights'           => 'CreateChild, DeleteChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner',
          'access_control_type' => 'Allow',
          'inheritance_type'    => 'None'
        },
        {
          'identity'            => "${facts['domain_sid']}-520",
          'ad_rights'           => 'CreateChild',
          'access_control_type' => 'Allow',
          'inheritance_type'    => 'None'
        }],
      }
    }
  }
}
