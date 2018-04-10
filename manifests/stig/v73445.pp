# This class manages:
# V-73443
# Windows Server 2016 must be configured to audit Logon/Logoff - Account Lockout successes.
# V-73445
# Windows Server 2016 must be configured to audit Logon/Logoff - Account Lockout failures.
class secure_windows::stig::v73445 (
  Boolean $enforced = false,
) {
  if $enforced {
    # This vulnerability is addressed in secure_windows::stig::v73443
  }
}
