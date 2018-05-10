# This class manages V-33665
# The system must be configured to audit DS Access - Directory Service Changes successes.
# This class manages V-33666
# The system must be configured to audit DS Access - Directory Service Changes failures.
class secure_windows::stig::v33665 (
  Boolean $enforced = true,
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
