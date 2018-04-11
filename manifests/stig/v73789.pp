# This class manages:
# V-73789
# The Load and unload device drivers user right must only be assigned to the Administrators group.
class secure_windows::stig::v73789 (
  Boolean $enforced = false,
) {
  if $enforced {
    local_security_policy { 'Load and unload device drivers':
      ensure         => 'present',
      policy_setting => 'SeLoadDriverPrivilege',
      policy_type    => 'Privilege Rights',
      policy_value   => '*S-1-5-32-544',
    }
  }
}
