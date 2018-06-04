# This class manages V-26473
# (Domain Controllers)
# The Allow log on through Remote Desktop Services user right must only be assigned to the Administrators group (Domain Controllers)
# (Member Servers)
# The Allow log on through Remote Desktop Services user right must only be assigned to the Administrators group and other approved groups

class secure_windows::stig::v26473 (
  Boolean $enforced = true,
) {
  if $enforced {
    if($facts['windows_server_type'] == 'windowsdc') {
      local_security_policy { 'Allow log on through Remote Desktop Services':
        ensure         => 'present',
        policy_setting => 'SeRemoteInteractiveLogonRight',
        policy_type    => 'Privilege Rights',
        policy_value   => '*S-1-5-32-544',
      }
    }
    else {
      if !($facts['windows_server_type'] == 'windowsdc') {
        local_security_policy { 'Allow log on through Remote Desktop Services':
          ensure         => 'present',
          policy_setting => 'SeRemoteInteractiveLogonRight',
          policy_type    => 'Privilege Rights',
          policy_value   => '*S-1-5-32-544',
        }
      }
    }
  }
}
