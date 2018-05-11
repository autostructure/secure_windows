# This class manages V-7002
# Windows 2012/2012 R2 accounts must be configured to require passwords.
class secure_windows::stig::v7002 (
  Boolean $enforced = true,
) {
  if $enforced {
    $message = 'Not in compliance with DoD STIG V-7002. Accounts exist that do not require passwords. Run \'net user [username] /passwordreq:yes\' for each finding.' # lint:ignore:140chars
    if $facts['windows_server_type'] == 'windowsdc' {
      if $facts['password_required_dc'] != '' {
        notify { 'Not in compliance with DoD STIG V-7002':
          message  => $message,
          loglevel => warning,
        }
      }
    }
    else {
      if $facts['password_required'] != '' {
        notify { 'Not in compliance with DoD STIG V-7002':
          message  => $message,
          loglevel => warning,
        }
      }
    }
  }
}
