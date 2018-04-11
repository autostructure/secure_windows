# This class manages:
# V-73393
# The Active Directory Infrastructure object must be configured with proper audit settings.
class secure_windows::stig::v73393 (
  Boolean $enforced = false,
) {
  if $enforced {
    if $facts['windows_server_type'] == 'windowsdc' {
      $root_domain = $facts['root_domain']

      ad_acl { "CN=Infrastructure,${root_domain}":
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
