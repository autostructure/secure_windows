# This class manages V-26469
# Unauthorized accounts must not have the Access Credential Manager as a trusted caller user right.

class secure_windows::stig::v26469 (
  Boolean $enforced = true,
) {
  if $enforced {
    local_security_policy { 'Access Credential Manager as a trusted caller':
      ensure         => 'absent',
    }
  }
}
