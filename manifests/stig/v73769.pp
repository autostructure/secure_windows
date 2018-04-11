# This class manages:
# V-73769
# The Deny log on locally user right on domain controllers must be configured to prevent unauthenticated access.
class secure_windows::stig::v73769 (
  Boolean $enforced = false,
) {
  if $enforced {
    if($facts['windows_server_type'] == 'windowsdc') {
      local_security_policy { 'Deny log on locally':
        ensure         => 'present',
        policy_setting => 'SeDenyInteractiveLogonRight',
        policy_type    => 'Privilege Rights',
        policy_value   => '*S-1-5-32-546',
      }
    }
  }
}
