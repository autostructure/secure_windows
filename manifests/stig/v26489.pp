# This class manages V-26489
# Unauthorized accounts must not have the Generate security audits user right.

class secure_windows::stig::v26489 (
  Boolean $enforced = true,
) {
  if $enforced {
    local_security_policy { 'Generate security audits':
      ensure         => 'present',
      policy_setting => 'SeAuditPrivilege',
      policy_type    => 'Privilege Rights',
      policy_value   => '*S-1-5-19,*S-1-5-20',
    }
  }
}
