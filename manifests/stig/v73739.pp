# This class manages:
# V-73739
# The Allow log on locally user right must only be assigned to the Administrators group.
class secure_windows::stig::v73739 (
  Boolean $enforced = false,
) {
  if $enforced {
    local_security_policy { 'Allow log on locally':
      ensure         => 'present',
      policy_setting => 'SeInteractiveLogonRight',
      policy_type    => 'Privilege Rights',
      policy_value   => '*S-1-5-32-544',
    }
  }
}
