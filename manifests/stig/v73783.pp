# This class manages:
# V-73783
# The Generate security audits user right must only be assigned to Local Service and Network Service.
class secure_windows::stig::v73783 (
  Boolean $enforced = false,
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
