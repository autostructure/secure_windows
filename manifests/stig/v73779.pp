# This class manages:
# V-73779
# The Enable computer and user accounts to be trusted for delegation user right must not be assigned to any groups or accounts on member
# servers.
class secure_windows::stig::v73779 (
  Boolean $enforced = false,
) {
  if $enforced {
    if($facts['windows_server_type'] == 'MemberServer') {
      local_security_policy { 'Enable computer and user accounts to be trusted for delegation':
        ensure         => 'absent',
      }
    }
  }
}
