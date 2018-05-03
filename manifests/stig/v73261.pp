# This class manages V-73261
# Accounts must require passwords.
class secure_windows::stig::v73261 (
  Boolean $enforced = false,
) {
  if $enforced {
    $message = 'Not in compliance with DoD STIG V-73261. Accounts exist that do not require passwords. Run \'net user [username] /passwordreq:yes\' for each finding.' # lint:ignore:140chars
    if $facts['windows_server_type'] == 'windowsdc' {
      if $facts['password_required_dc'] != '' {
        notify { 'Not in compliance with DoD STIG V-73261':
          message  => $message,
          loglevel => warning,
        }
      }
    }
    else {
      if $facts['password_required'] != '' {
        notify { 'Not in compliance with DoD STIG V-73261':
          message  => $message,
          loglevel => warning,
        }
      }
    }
  }

}
