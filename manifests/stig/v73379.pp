# This class manages:
# V-73379
# Data files owned by users must be on a different logical partition from the directory server data files.
class secure_windows::stig::v73379 (
  Boolean $enforced = false,
) {
  if $enforced {
    if $facts['windows_server_type'] == 'windowsdc' {
      $dsa_database_file = $facts['ntds_parameters']['DSA Database file']
      $dsa_database_partition = regsubst($dsa_database_file, '(^[^\/]+)\/', '\1')
      notify { 'message123455':
        message => $dsa_database_partition,
      }
    }
  }
}
