# This class manages:
# V-73451
# Windows Server 2016 must be configured to audit Logon/Logoff - Logon successes.
# V-73453
# Windows Server 2016 must be configured to audit Logon/Logoff - Logon failures.
class secure_windows::stig::v73453 (
  Boolean $enforced = false,
) {
  if $enforced {
    # This vulnerability is addressed in secure_windows::stig::v73453
  }
}
