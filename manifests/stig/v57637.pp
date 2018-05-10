# This class manages V-57637
# The operating system must employ a deny-all, permit-by-exception policy to allow the execution of authorized software programs.
class secure_windows::stig::v57637 (
  Boolean $enforced = true,
) {
  if $enforced {
    include ::secure_windows::applocker_startup
  }
}
