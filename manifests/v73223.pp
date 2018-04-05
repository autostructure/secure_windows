# This class manages V-73223
# Passwords for the built-in Administrator account must be changed at least every 60 days.
class secure_windows::v73223 {
  if $facts['windows_server_type'] == 'windowsdc' {

  }
  else {

  }
}
