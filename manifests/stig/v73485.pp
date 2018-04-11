# This class manages:
# V-73483
# Windows Server 2016 must be configured to audit System - Security System Extension successes.
# V-73485
# Windows Server 2016 must be configured to audit System - Security System Extension failures.
class secure_windows::stig::v73485 (
  Boolean $enforced = false,
) {
  # This vulnerability is addressed in secure_windows::stig::v73483
}
