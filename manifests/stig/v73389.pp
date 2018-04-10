# This class manages:
# V-73389
# Active Directory Group Policy objects must be configured with proper audit settings.
class secure_windows::stig::v73389 (
  Boolean $enforced = false,
) {
  if $enforced {
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
    }
  }
}
