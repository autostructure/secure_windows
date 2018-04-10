# This class manages:
# V-73469
# Windows Server 2016 must be configured to audit Privilege Use - Sensitive Privilege Use successes.
# V-73471
# Windows Server 2016 must be configured to audit Privilege Use - Sensitive Privilege Use failures.
class secure_windows::stig::v73471 (
  Boolean $enforced = false,
) {
  if $enforced {
    # This vulnerability is addressed in secure_windows::stig::v73469
  }
}
