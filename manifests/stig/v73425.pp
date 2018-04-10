# This class manages:
# V-73423
# Windows Server 2016 must be configured to audit Account Management - Security Group Management successes.
# V-73425
# Windows Server 2016 must be configured to audit Account Management - Security Group Management failures.
class secure_windows::stig::v73425 (
  Boolean $enforced = false,
) {
  # This vulnerability is addressed in secure_windows::stig::v73423
}
