# This class manages V-26487
# Unauthorized accounts must not have the Enable computer and user accounts to be trusted for delegation user right
# on domain controllers/member servers.

class secure_windows::stig::v26487 (
  Boolean $enforced = true,
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
    elsif($facts['windows_server_type'] == 'MemberServer') {
      local_security_policy { 'Enable computer and user accounts to be trusted for delegation':
        ensure         => 'absent',
      }
    }
  }
}
