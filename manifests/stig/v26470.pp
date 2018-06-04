# This class manages V-26470
# Unauthorized accounts must not have the Access this computer from the network user right on domain controllers.

class secure_windows::stig::v26470 (
  Boolean $enforced = true,
) {
  if $enforced {
    if ($facts['windows_server_type'] == 'windowsdc') {
      local_security_policy { 'Access this computer from the network':
        ensure         => 'present',
        policy_setting => 'SeNetworkLogonRight',
        policy_type    => 'Privilege Rights',
        policy_value   => '*S-1-5-32-544,*S-1-5-11,*S-1-5-9 ',
      }
    }
    else {
      if !($facts['windows_server_type'] == 'windowsdc') {
        local_security_policy { 'Access this computer from the network':
          ensure         => 'present',
          policy_setting => 'SeNetworkLogonRight',
          policy_type    => 'Privilege Rights',
          policy_value   => '*S-1-5-32-544,*S-1-5-11',
        }
    }
  }
}
}
