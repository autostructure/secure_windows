# This class manages V-26497
# Unauthorized accounts must not have the Modify an object label user right.

class secure_windows::stig::v26497 (
  Boolean $enforced = true,
) {
  if $enforced {
    local_security_policy { 'Modify an object label':
      ensure         => 'absent',
    }
  }
}
