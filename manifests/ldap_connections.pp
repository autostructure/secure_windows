# This class manages V-73387
class secure_windows::ldap_connections {

  # V-73387
  # The directory service must be configured to terminate LDAP-based network connections to the directory server after 5 minutes of inactivity.
  exec { 'V-73387: Set NTDSUtil MaxConnIdleTime':
    command => 'C:\\Windows\\System32\\ntdsutil.exe "LDAP policies" "connections" "connect to server win10.example.com" "q" "Set MaxConnIdleTime to 450" "Commit Changes" "q" "q"'
  }
}
