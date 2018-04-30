# This class manages V-73263
# Passwords must be configured to expire.
class secure_windows::stig::v73263 {
  if $facts['windows_server_type'] == 'windowsdc' {
    if $facts['password_expire_dc'] != '' {
      notify { 'Not in compliance with DoD STIG V-73263':
        message  => 'Not in compliance with DoD STIG V-73263. There are user accounts with passwords not configured to expire.',
        loglevel => warning,
      }
    }
  }
  else {
    if $facts['password_expire'] != '' {
      notify { 'Not in compliance with DoD STIG V-73263':
        message  => 'Not in compliance with DoD STIG V-73263. There are user accounts with passwords not configured to expire.',
        loglevel => warning,
      }
    }
  }
}
