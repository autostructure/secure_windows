# This class manages:
# V-73379
# Data files owned by users must be on a different logical partition from the directory server data files.
class secure_windows::stig::v73379 (
  Boolean $enforced = false,
) {
  if $enforced {
    if $facts['windows_server_type'] == 'windowsdc' {
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
          notify { 'erguh4':
            message => 'There is a C$ or D$ share',
          }
        }
        else {
          notify { 'erguh5':
            message => 'There is a user share',
          }
          notify { 'erguh6':
            message => "${name} ${path}",
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
