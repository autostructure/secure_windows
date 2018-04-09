# secure_windows::acl
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include secure_windows::acl
class secure_windows::ad_acl {

  if $facts['windows_server_type'] == 'windowsdc' {
    package { 'nokogiri':
      ensure   => installed,
      provider => 'gem',
    }

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
        }
      ],
    }

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
        }
      ],
    }

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
        }
      ],
    }

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
        }
      ],
    }

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
        }
      ],
    }

  }

}
