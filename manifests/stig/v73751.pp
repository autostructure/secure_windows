# This class manages:
# V-73751
# The Create permanent shared objects user right must not be assigned to any groups or accounts.
class secure_windows::stig::v73751 (
  Boolean $enforced = false,
) {
  if $enforced {
    local_security_policy { 'Create permanent shared objects':
      ensure         => 'absent',
    }
  }
}
