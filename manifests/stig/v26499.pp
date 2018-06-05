# This class manages V-26499
# Unauthorized accounts must not have the Perform volume maintenance tasks user right.

class secure_windows::stig::v26499 (
  Boolean $enforced = true,
) {
  if $enforced {
    local_security_policy { 'Perform volume maintenance tasks':
      ensure         => 'present',
      policy_setting => 'SeManageVolumePrivilege',
      policy_type    => 'Privilege Rights',
      policy_value   => '*S-1-5-32-544',
    }
  }
}
