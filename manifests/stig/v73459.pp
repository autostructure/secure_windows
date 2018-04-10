# This class manages:
# V-73457
# Windows Server 2016 must be configured to audit Object Access - Removable Storage successes.
# V-73459
# Windows Server 2016 must be configured to audit Object Access - Removable Storage failures.
class secure_windows::stig::v73459 (
  Boolean $enforced = false,
) {
  if $enforced {
    # This vulnerability is addressed is secure_windows::stig::v73457
  }
}
