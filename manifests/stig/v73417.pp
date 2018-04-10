# This class manages V-73417
# Windows Server 2016 must be configured to audit Account Management - Computer Account Management successes.
class secure_windows::stig::v73417 (
  Boolean $enforced = false,
) {
  if $enforced {
    if($facts['windows_server_type'] == 'windowsdc') {
      auditpol { 'Computer Account Management':
        success => 'enable',
        failure => 'disable',
      }
    }
  }
}
