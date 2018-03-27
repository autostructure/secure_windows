# This class manages settings for FTP servers
class secure_windows::ftp_servers {
  if ($facts['windows_role'] and
      $facts['windows_role'] =~ /(^184|,184,|,184$)/) {
    notify { 'FTP Server':
      message => 'I am a FTP Server!',
    }
  }
}
