# This class manages:
# V-73791
# The Lock pages in memory user right must not be assigned to any groups or accounts.
class secure_windows::stig::v73791 (
  Boolean $enforced = false,
) {
  if $enforced {
    local_security_policy { 'Lock pages in memory':
      ensure         => 'absent',
    }
  }
}
