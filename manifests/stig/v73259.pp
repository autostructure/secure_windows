# This class manages V-73259
# Outdated or unused accounts must be removed from the system or disabled.
class secure_windows::stig::v73259 (
  Boolean $enforced = false,
) {
  if $enforced {
      if $facts['unused_accounts'] {
        notify { 'V-73259':
          message  => 'Not in compliance with DoD STIG V-73259. There are unused accounts that must be removed from the system',
          loglevel => warning,
        }
      }
    }
  }
}
