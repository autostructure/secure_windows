# This class manages:
# V-73797
# The Perform volume maintenance tasks user right must only be assigned to the Administrators group.
class secure_windows::stig::v73797 (
  Boolean $enforced = false,
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
