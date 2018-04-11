# This class manages:
# V-73435
# Windows Server 2016 must be configured to audit DS Access - Directory Service Access successes.
# V-73437
# Windows Server 2016 must be configured to audit DS Access - Directory Service Access failures.
class secure_windows::stig::v73435 (
  Boolean $enforced = false,
) {
  if $enforced {
    if($facts['windows_server_type'] == 'windowsdc') {
      auditpol { 'Directory Service Access':
        success => 'enable',
        failure => 'enable',
      }
    }
  }
}
