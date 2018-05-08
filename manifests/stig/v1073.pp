# This class manages V-1073
# Systems must be maintained at a supported service pack level.
class secure_windows::stig::v1073 (
  Boolean $enforced = true,
) {
  if $enforced {
    if (versioncmp($facts['kernelversion'], '9200') < 0) {
      notify { 'v1073':
        message  => 'Not in compliance with DoD STIG v1073. System is not at a supported servicing level.',
        loglevel => warning,
      }
    }
  }
}
