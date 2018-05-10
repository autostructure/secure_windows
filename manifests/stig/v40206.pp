# This class manages V-40206
#
class secure_windows::stig::v40206 (
  Boolean $enforced = true,
) {
  if $enforced {
    service { 'SCPolicySvc':
      enable => true,
    }
  }
}
