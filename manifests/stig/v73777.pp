# This class manages:
# V-73777
# The Enable computer and user accounts to be trusted for delegation user right must only be assigned to the Administrators group on
# domain controllers.
class secure_windows::stig::v73777 (
  Boolean $enforced = false,
) {
  if $enforced {
    if($facts['windows_server_type'] == 'windowsdc') {
      local_security_policy { 'Enable computer and user accounts to be trusted for delegation':
        ensure         => 'present',
        policy_setting => 'SeEnableDelegationPrivilege',
        policy_type    => 'Privilege Rights',
        policy_value   => '*S-1-5-32-544',
      }
    }
  }
}
