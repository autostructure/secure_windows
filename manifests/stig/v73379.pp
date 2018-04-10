# This class manages:
# V-73379
# Data files owned by users must be on a different logical partition from the directory server data files.
class secure_windows::stig::v73379 (
  Boolean $enforced = false,
) {
  if $enforced {
    if $facts['windows_server_type'] == 'windowsdc' {
      $dsa_databse_file = $facts['ntds_parameters']['DSA Databse File']
      $dsa_databse_partition = regsubst($dsa_databse_file, '^(.+)/Windows', '\1')
      notify { 'message123455':
        message => $dsa_databse_partition,
      }
    }
  }
}
