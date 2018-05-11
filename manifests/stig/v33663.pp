# This class manages V-33663
# The system must be configured to audit DS Access - Directory Service Access successes.
# This class manages V-33664
# The system must be configured to audit DS Access - Directory Service Access failures.
class secure_windows::stig::v33663 (
  Boolean $enforced = true,
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
