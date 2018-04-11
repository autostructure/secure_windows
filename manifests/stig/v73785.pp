# This class manages:
# V-73785
# The Impersonate a client after authentication user right must only be assigned to Administrators, Service, Local Service, and Network
# Service.
class secure_windows::stig::v73785 (
  Boolean $enforced = false,
) {
  if $enforced {
    local_security_policy { 'Impersonate a client after authentication':
      ensure         => 'present',
      policy_setting => 'SeImpersonatePrivilege',
      policy_type    => 'Privilege Rights',
      policy_value   => '*S-1-5-19,*S-1-5-20,*S-1-5-32-544,*S-1-5-6',
    }
  }
}
