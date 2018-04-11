# This class manages:
# V-73731
# The Access this computer from the network user right must only be assigned to the Administrators, Authenticated Users, and
# Enterprise Domain Controllers groups on domain controllers.
class secure_windows::stig::v73731 (
  Boolean $enforced = false,
) {
  if $enforced {
    if($facts['windows_server_type'] == 'windowsdc') {
      local_security_policy { 'Access this computer from the network':
        ensure         => 'present',
        policy_setting => 'SeNetworkLogonRight',
        policy_type    => 'Privilege Rights',
        policy_value   => '*S-1-5-32-544,*S-1-5-11,*S-1-5-9',
      }
    }
  }
}
