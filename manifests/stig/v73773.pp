# This class manages:
# V-73773
# The Deny log on through Remote Desktop Services user right on domain controllers must be configured to prevent unauthenticated access.
class secure_windows::stig::v73773 (
  Boolean $enforced = false,
) {
  if $enforced {
    if($facts['windows_server_type'] == 'windowsdc') {
      local_security_policy { 'Deny log on through Remote Desktop Services':
        ensure         => 'present',
        policy_setting => 'SeDenyRemoteInteractiveLogonRight',
        policy_type    => 'Privilege Rights',
        policy_value   => '*S-1-5-32-546',
      }
    }
  }
}
