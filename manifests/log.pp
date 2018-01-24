#
# This class uses a puppet forge module to make changes
# to the Windows Registry in support of DoD hardening.
#
# TODO:
# - Add unit testing
# - Consider adding custom warning log/sysout messages
#
class secure_windows::log (
  String  $message,
  Boolean $log = false,
) {

  # Turn log messages on/off for this manifest
  $logging = $::dod_harden_redhat::secure_system::log

}
