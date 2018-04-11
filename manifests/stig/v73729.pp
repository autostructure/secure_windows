# This class manages:
# V-73729
# The Access Credential Manager as a trusted caller user right must not be assigned to any groups or accounts.
class secure_windows::stig::v73729 (
  Boolean $enforced = false,
) {
  if $enforced {
    local_security_policy { 'Access Credential Manager as a trusted caller':
      ensure         => 'absent',
    }
  }
}
