# This class manages V-26506
# Unauthorized accounts must not have the Take ownership of files or other objects user right.

class secure_windows::stig::v26506 (
  Boolean $enforced = true,
) {
  if $enforced {
    local_security_policy { 'Take ownership of files or other objects':
      ensure         => 'present',
      policy_setting => 'SeTakeOwnershipPrivilege',
      policy_type    => 'Privilege Rights',
      policy_value   => '*S-1-5-32-544',
    }
  }
}
