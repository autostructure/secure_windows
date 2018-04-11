# This class manages:
# V-73757
# The Deny access to this computer from the network user right on domain controllers must be configured to prevent
# unauthenticated access.
class secure_windows::stig::v73757 (
  Boolean $enforced = false,
) {
  if $enforced {
    if($facts['windows_server_type'] == 'windowsdc') {
      local_security_policy { 'Deny access to this computer from the network':
        ensure         => 'present',
        policy_setting => 'SeDenyNetworkLogonRight',
        policy_type    => 'Privilege Rights',
        policy_value   => '*S-1-5-32-546',
      }
    }
  }
}
