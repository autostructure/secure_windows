# secure_windows::acl
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include secure_windows::acl
class secure_windows::ad_acl {
  ad_acl { 'CN=RID Manager$,CN=System':
    audit_rules  => [
      {
        'ad_rights'        => 'WriteProperty, ExtendedRight',
        'identity'         => 'Everyone',
        'audit_flags'      => 'Success',
        'inheritance_type' => 'None',
      },
      {
        'ad_rights'        => 'GenericAll',
        'identity'         => 'Everyone',
        'audit_flags'      => 'Failure',
        'inheritance_type' => 'None',
      }
    ],
  }

  ad_acl { 'CN=Infrastructure':
    audit_rules  => [
      {
        'ad_rights'        => 'WriteProperty, ExtendedRight',
        'identity'         => 'Everyone',
        'audit_flags'      => 'Success',
        'inheritance_type' => 'None',
      },
      {
        'ad_rights'        => 'GenericAll',
        'identity'         => 'Everyone',
        'audit_flags'      => 'Failure',
        'inheritance_type' => 'None',
      }
    ],
  }

  ad_acl { 'OU=Domain Controllers':
    audit_rules  => [
      {
        'ad_rights'        => 'WriteDacl',
        'identity'         => 'Everyone',
        'audit_flags'      => 'Success',
        'inheritance_type' => 'None',
      },
      {
        'ad_rights'        => 'WriteProperty',
        'identity'         => 'Everyone',
        'audit_flags'      => 'Success',
        'inheritance_type' => 'All',
      },
      {
        'ad_rights'        => 'GenericAll',
        'identity'         => 'Everyone',
        'audit_flags'      => 'Failure',
        'inheritance_type' => 'None',
      }
    ],
  }

  ad_acl { 'CN=AdminSDHolder,CN=System':
    audit_rules  => [
      {
        'ad_rights'        => 'WriteProperty, WriteDacl, WriteOwner',
        'identity'         => 'Everyone',
        'audit_flags'      => 'Success',
        'inheritance_type' => 'None',
      },
      {
        'ad_rights'        => 'GenericAll',
        'identity'         => 'Everyone',
        'audit_flags'      => 'Failure',
        'inheritance_type' => 'None',
      }
    ],
  }

  ad_acl { 'CN=Policies,CN=System':
    audit_rules  => [
      {
        'ad_rights'        => 'WriteProperty, WriteDacl',
        'identity'         => 'Everyone',
        'audit_flags'      => 'Success',
        'inheritance_type' => 'Descendents',
      },
      {
        'ad_rights'        => 'GenericAll',
        'identity'         => 'Everyone',
        'audit_flags'      => 'Failure',
        'inheritance_type' => 'None',
      }
    ],
  }

  ad_acl { '':
    audit_rules  => [
      {
        'ad_rights'        => 'WriteProperty, WriteDacl, WriteOwner',
        'identity'         => 'Everyone',
        'audit_flags'      => 'Success',
        'inheritance_type' => 'None',
      },
      {
        'ad_rights'        => 'ExtendedRight',
        'identity'         => 'AccountDomainUsersSid',
        'audit_flags'      => 'Success',
        'inheritance_type' => 'None',
      },
      {
        'ad_rights'        => 'ExtendedRight',
        'identity'         => 'BuiltinAdministratorsSid',
        'audit_flags'      => 'Success',
        'inheritance_type' => 'None',
      },
      {
        'ad_rights'        => 'GenericAll',
        'identity'         => 'Everyone',
        'audit_flags'      => 'Failure',
        'inheritance_type' => 'None',
      }
    ],
  }
}
