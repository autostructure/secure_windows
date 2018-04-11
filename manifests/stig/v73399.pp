# This class manages:
# V-73399
# The Active Directory RID Manager$ object must be configured with proper audit settings.
class secure_windows::stig::v73399 (
  Boolean $enforced = false,
) {
  if $enforced {
    if $facts['windows_server_type'] == 'windowsdc' {
      $root_domain = $facts['root_domain']

      ad_acl { "CN=RID Manager$,CN=System,${root_domain}":
        audit_rules  => [
          {
            'ad_rights'        => 'WriteProperty, ExtendedRight',
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
