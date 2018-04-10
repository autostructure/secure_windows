# This class manages:
# V-73391
# The Active Directory Domain object must be configured with proper audit settings.
class secure_windows::stig::v73391 (
  Boolean $enforced = false,
) {
  if $enforced {
    $root_domain = $facts['root_domain']

    ad_acl { $root_domain:
      audit_rules  => [
        {
          'ad_rights'        => 'WriteProperty, WriteDacl, WriteOwner',
          'identity'         => 'S-1-1-0',
          'audit_flags'      => 'Success',
          'inheritance_type' => 'None',
        },
        {
          'ad_rights'        => 'ExtendedRight',
          'identity'         => 'S-1-5-21-429241146-72105815-2897606901-513',
          'audit_flags'      => 'Success',
          'inheritance_type' => 'None',
        },
        {
          'ad_rights'        => 'ExtendedRight',
          'identity'         => 'S-1-5-32-544',
          'audit_flags'      => 'Success',
          'inheritance_type' => 'None',
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
