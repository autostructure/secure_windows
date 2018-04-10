# This class manages:
# V-73461
# Windows Server 2016 must be configured to audit Policy Change - Audit Policy Change successes.
# V-73463
# Windows Server 2016 must be configured to audit Policy Change - Audit Policy Change failures.
class secure_windows::stig::v73463 (
  Boolean $enforced = false,
) {
  if $enforced {
    # This vulnerability is addressed is secure_windows::stig::v73461
  }
}
