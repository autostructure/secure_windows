# This class manages:
# V-73477
# Windows Server 2016 must be configured to audit System - Other System Events successes.
# V-73479
# Windows Server 2016 must be configured to audit System - Other System Events failures.
class secure_windows::stig::v73479 (
  Boolean $enforced = false,
) {
  if $enforced {
    # This vulnerability is addressed in secure_windows::stig::v73477
  }
}
