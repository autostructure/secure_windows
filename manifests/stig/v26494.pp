# This class manages V-26494
# Unauthorized accounts must not have the Lock pages in memory user right.

class secure_windows::stig::v26494 (
  Boolean $enforced = true,
) {
  if $enforced {
    local_security_policy { 'Lock pages in memory':
      ensure         => 'absent',
    }
  }
}
