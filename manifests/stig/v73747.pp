# This class manages:
# V-73747
# The Create a token object user right must not be assigned to any groups or accounts.
class secure_windows::stig::v73747 (
  Boolean $enforced = false,
) {
  if $enforced {
    local_security_policy { 'Create a token object':
      ensure         => 'absent',
    }
  }
}
