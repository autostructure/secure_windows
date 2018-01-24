#
# This class uses a puppet forge module to make changes
# to the Windows Registry in support of DoD hardening.
#
# TODO:
# - Add unit testing
# - Consider adding custom warning log/sysout messages
#
define secure_windows::log (
  String  $message,
  Boolean $enabled,
) {

  if $enabled {
    # puppetserver.log
    warning("${facts['fqdn']}: ${message}")

    # puppet agent logging
    notify { 'puppetagentlogger':
      withpath => false,
      message  => $message,
      loglevel => warning,
    }

  }

}
