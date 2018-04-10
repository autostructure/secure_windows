# This class manages:
# V-73405
# Permissions for the Application event log must prevent access by non-privileged accounts.
# V-73407
# Permissions for the Security event log must prevent access by non-privileged accounts.
# V-73409
# Permissions for the System event log must prevent access by non-privileged accounts.
class secure_windows::stig::v73409 (
  Boolean $enforced = false,
) {
  # This vulnerability has been addressed by secure_windows::stig::v73405
}
