# This class manages V-73223
# Passwords for the built-in Administrator account must be changed at least every 60 days.
class secure_windows::stig::v73223 (
  Boolean $enforced = false,
) {
  # secure_windows::stig::v73317 changes the max password age for accounts to be 60 days.
  # It does not, however, actually change the password every 60 days. Use an automated tool, such
  # as Microsoft's Local Administrator Password Solution (LAPS) to address this vulnerability.
}
