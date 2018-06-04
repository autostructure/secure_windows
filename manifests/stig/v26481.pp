# This class manages V-26481
# Unauthorized accounts must not have the Create permanent shared objects user right.

class secure_windows::stig::v26481 (
  Boolean $enforced = true,
) {
  if $enforced {
    local_security_policy { 'Create permanent shared objects':
      ensure         => 'absent',
    }
  }
}
