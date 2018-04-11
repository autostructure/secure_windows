# This class manages:
# V-73439
# Windows Server 2016 must be configured to audit DS Access - Directory Service Changes successes.
# V-73441
# Windows Server 2016 must be configured to audit DS Access - Directory Service Changes failures.
class secure_windows::stig::v73439 (
  Boolean $enforced = false,
) {
  if $enforced {
    if($facts['windows_server_type'] == 'windowsdc') {
      auditpol { 'Directory Service Changes':
        success => 'enable',
        failure => 'enable',
      }
    }
  }
}
