# This class manages:
# V-73395
# The Active Directory Domain Controllers Organizational Unit (OU) object must be configured with proper audit settings.
class secure_windows::stig::v73395 (
  Boolean $enforced = false,
) {
  if $enforced {
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
    }
  }
}
