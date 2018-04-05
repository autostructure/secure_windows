# This class manages V-73263
# Passwords must be configured to expire.
class secure_windows::stig::v73263 {
  if $facts['windows_server_type'] == 'windowsdc' {
    if $facts['password_expire_dc'] != '' {
      notify { 'Not in compliance with DoD STIG V-73261':
        message  => 'Not in compliance with DoD STIG V-73263.',
        loglevel => warning,
      }
    }
  }
  else {
    if $facts['password_expire'] != '' {
      notify { 'Not in compliance with DoD STIG V-73261':
        message  => 'Not in compliance with DoD STIG V-73263.',
        loglevel => warning,
      }
    }
  }
}
