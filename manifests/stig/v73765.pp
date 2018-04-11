# This class manages:
# V-73765
# The Deny log on as a service user right must be configured to include no accounts or groups (blank) on domain controllers.
class secure_windows::stig::v73765 (
  Boolean $enforced = false,
) {
  if $enforced {
    if($facts['windows_server_type'] == 'windowsdc') {
      local_security_policy { 'Deny log on as a service':
        ensure         => 'absent',
      }
    }
  }
}
