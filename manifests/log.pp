#
# This class centralizes log formatting for the module.
#
# TODO:
# - Add unit testing
#
define secure_windows::log (
  Boolean $enabled = true,
  String $threatlevel = 'warning',
) {

  if $enabled {
    # puppetserver.log
    warning("${facts['fqdn']}: ${title}")

    # puppet agent logging
    notify { "puppetagentlogger_${title}":
      withpath => false,
      message  => $title,
      loglevel => $threatlevel,
    }

  }

}
