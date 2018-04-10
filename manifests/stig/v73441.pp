# This class manages:
# V-73439
# Windows Server 2016 must be configured to audit DS Access - Directory Service Changes successes.
# V-73441
# Windows Server 2016 must be configured to audit DS Access - Directory Service Changes failures.
class secure_windows::stig::v73441 (
  Boolean $enforced = false,
) {
  if $enforced {
    # This vulnerability is addressed in secure_windows::stig::v73439
  }
}
