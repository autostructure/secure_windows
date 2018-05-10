# This class manages V-36657
# The screen saver must be password protected.
class secure_windows::stig::v36657 (
  Boolean $enforced = true,
) {
  if $enforced {
    # HKCU not supported
  }
}
