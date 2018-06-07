# This class manages V-26501
# Unauthorized accounts must not have the Profile system performance user right.

class secure_windows::stig::v26501 (
  Boolean $enforced = true,
) {
  if $enforced {
    local_security_policy { 'Profile system performance':
      ensure         => 'present',
      policy_setting => 'SeSystemProfilePrivilege',
      policy_type    => 'Privilege Rights',
      policy_value   => '*S-1-5-32-544,*S-1-5-80-3139157870-2983391045-3678747466-658725712-1809340420',
    }
  }
}
