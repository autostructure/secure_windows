# This class manages V-39328
# The Active Directory Domain Controllers Organizational Unit (OU) object must be configured with proper audit settings.

class secure_windows::stig::v39328 (
  Boolean $enforced = true,
  ) {
        if $enforced {
          $ou_array = $facts['organizational_units']
          $ou_array.each |$name| {
            if $name != 'Domain Controllers' {
              ad_acl { "ou=${name},${facts['root_domain']}":
                access_rules => [
                {
                  'identity'            => 'S-1-1-0',
                  'ad_rights'           => 'DeleteTree, Delete',
                  'access_control_type' => 'Deny',
                  'inheritance_type'    => 'None'
                },
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
                  'identity'            => 'S-1-5-21-2537783290-4083596532-1772155507-512',
                  'ad_rights'           => 'GenericAll',
                  'access_control_type' => 'Allow',
                  'inheritance_type'    => 'None'
                }],
              }
            }
          }
        }
      }
