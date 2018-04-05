# This class manages V-73261
# Accounts must require passwords.
class secure_windows::stig::v73261 {
  if $facts['windows_server_type'] == 'windowsdc' {
    if $facts['password_required_dc'] != '' {
      notify { 'Not in compliance with DoD STIG V-73261':
        message  => 'Not in compliance with DoD STIG V-73261. AD accounts exist that do not require passwords. Run \'net user [username] /passwordreq:yes\' for each finding.',
        loglevel => warning,
      }
    }
  }
  else {
    if $facts['password_required'] != '' {
      notify { 'Not in compliance with DoD STIG V-73261':
        message  => 'Not in compliance with DoD STIG V-73261. Local accounts exist that do not require passwords. Run \'net user [username] /passwordreq:yes\' for each finding.',
        loglevel => warning,
      }
    }
  }
}
