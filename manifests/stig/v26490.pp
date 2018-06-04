# This class manages V-26490
# Unauthorized accounts must not have the Impersonate a client after authentication user right.

class secure_windows::stig::v26490 (
  Boolean $enforced = true,
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
