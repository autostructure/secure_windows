# This class manages V-26531
# Windows Server 2012/2012 R2 domain controllers must be configured to audit Account Management - Computer Account Management successes.

class secure_windows::stig::v26531 (
  Boolean $enforced = true,
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
