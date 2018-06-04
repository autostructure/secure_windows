# This class manages V-26479
# Unauthorized accounts must not have the Create a token object user right.

class secure_windows::stig::v26479 (
  Boolean $enforced = true,
) {
  if $enforced {
    local_security_policy { 'Create a token object':
      ensure         => 'absent',
    }
  }
}
