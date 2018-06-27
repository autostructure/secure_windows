# This class manages V-39329
# The Active Directory AdminSDHolder object must be configured with proper audit settings.

class secure_windows::stig::v39329 (
  Boolean $enforced = true,
) {
  if $enforced {
    if $facts['windows_server_type'] == 'windowsdc' {
      $root_domain = $facts['root_domain']

      ad_acl { "CN=AdminSDHolder,CN=System,${root_domain}":
        audit_rules  => [
          {
            'ad_rights'        => 'WriteProperty, WriteDacl, WriteOwner',
            'identity'         => 'S-1-1-0',
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
}
