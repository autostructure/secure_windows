# This class manages:
# V-73379
# Data files owned by users must be on a different logical partition from the directory server data files.
class secure_windows::stig::v73379 (
  Boolean $enforced = false,
) {
  #if $enforced {
    # if $facts['windows_server_type'] == 'windowsdc' {
    #   $dsa_database_partition = regsubst($facts['ntds_parameters']['DSA Database file'], '^(.*:).*$', '\1')
    #   $shares = $facts['shares']
    #   $relevant_shares = $shares.filter |$items| { $items[0] =~ /!SYSVOL/ }
    #   notify { 'testestetughei':
    #     message => $shares,
    #   }
    #   notify { 'tesgeirughse':
    #     message => $relevant_shares,
    #   }
    # }

    # Check the 'shares' fact to verify this STIG
  #}
}
