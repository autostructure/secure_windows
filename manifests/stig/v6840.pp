# This class manages V-6840
# Windows 2012/2012 R2 passwords must be configured to expire.
class secure_windows::stig::v6840 (
  Boolean $enforced = true,
) {
  if $enforced {
    $message = 'Not in compliance with DoD STIG V-6840. There are user accounts with passwords not configured to expire.'
    if $facts['windows_server_type'] == 'windowsdc' {
      if $facts['password_expire_dc'] != '' {
        notify { 'Not in compliance with DoD STIG V-6840':
          message  => $message,
          loglevel => warning,
        }
      }
    }
    else {
      if $facts['password_expire'] != '' {
        notify { 'Not in compliance with DoD STIG V-6840':
          message  => $message,
          loglevel => warning,
        }
      }
    }
  }
}
