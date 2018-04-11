# This class manages:
# V-73379
# Data files owned by users must be on a different logical partition from the directory server data files.
class secure_windows::stig::v73379 (
  Boolean $enforced = false,
) {
  if $enforced {
    if $facts['windows_server_type'] == 'windowsdc' {
      $dsa_database_partition = regsubst($facts['ntds_parameters']['DSA Database file'], '^(.*:).*$', '\1')
      $hash_of_shares = $facts['shares']
      $hash_of_shares.each |$name,$path| {
        if $name =~ /^SYSVOL/ {
          notify { 'erguh':
            message => 'There is a SYSVOL share',
          }
        }
        elsif $name =~ /^NETLOGON/ {
          notify { 'erguh2':
            message => 'There is a NETLOGON share',
          }
        }
        elsif $name =~ /^ADMIN\$/ {
          notify { 'erguh3':
            message => 'There is a ADMIN$ share',
          }
        }
        elsif $name =~ /^.{1}\$/ {
          notify { $name:
            message => 'There is a C$ or D$ share',
          }
        }
        else {
          if $path =~ $dsa_database_partition {
            notify { "Share ${path} violates V-73379":
              message => "Not in compliance with DoD STIG V-73379. Share ${path} is a user drive on the same partition as ${facts['ntds_parameters']['DSA Database file']}",
            }
          }
        }
      }











      # $dsa_database_partition = regsubst($facts['ntds_parameters']['DSA Database file'], '^(.*:).*$', '\1')
      # $shares = $facts['shares']
      # $relevant_shares = $shares.filter |$items| { $items[0] =~ /!SYSVOL/ }
      # notify { 'testestetughei':
      #   message => $shares,
      # }
      # notify { 'tesgeirughse':
      #   message => $relevant_shares,
      # }
    }

    # Check the 'shares' fact to verify this STIG
  }
}
