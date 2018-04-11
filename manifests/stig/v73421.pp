# This class manages:
# V-73419
# Windows Server 2016 must be configured to audit Account Management - Other Account Management Events successes.
# V-73421
# Windows Server 2016 must be configured to audit Account Management - Other Account Management Events failures.
class secure_windows::stig::v73421 (
  Boolean $enforced = false,
) {
  # This vulnerability is addressed in secure_windows::stig::v73419
}
