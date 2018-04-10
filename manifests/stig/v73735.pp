# This class manages:
# V-73735
# The Act as part of the operating system user right must not be assigned to any groups or accounts.
class secure_windows::stig::v73735 (
  Boolean $enforced = false,
) {
  if $enforced {
    local_security_policy { 'Act as part of the operating system':
      ensure         => 'absent',
    }
  }
}
