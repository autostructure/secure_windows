# V-73235
# Windows Server 2016 must employ a deny-all, permit-by-exception policy to allow the execution of authorized software programs.
class secure_windows::stig::v73235 (
  Boolean $enforced = false,
) {

  if $enforced {

    include ::secure_windows::applocker_startup

  }

}
