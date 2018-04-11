# This class manages:
# V-73749
# The Create global objects user right must only be assigned to Administrators, Service, Local Service, and Network Service.
class secure_windows::stig::v73749 (
  Boolean $enforced = false,
) {
  if $enforced {
    local_security_policy { 'Create global objects':
      ensure         => 'present',
      policy_setting => 'SeCreateGlobalPrivilege',
      policy_type    => 'Privilege Rights',
      policy_value   => '*S-1-5-19,*S-1-5-20,*S-1-5-32-544,*S-1-5-6',
    }
  }
}
