# This class manages V-26483
# (Domain Controller)
# The Deny log on as a batch job user right on domain controllers must be configured to prevent unauthenticated access.
# (Member Servers)
# The Deny log on as a batch job user right on member servers must be configured to prevent access from highly privileged domain accounts
#on domain systems, and from unauthenticated access on all systems.

class secure_windows::stig::v26483 (
  Boolean $enforced = true,
) {
  if $enforced {
    if($facts['windows_server_type'] == 'windowsdc') {
      #domain controller
      local_security_policy { 'Deny log on as a batch job':
        ensure         => 'present',
        policy_setting => 'SeDenyBatchLogonRight',
        policy_type    => 'Privilege Rights',
        policy_value   => '*S-1-5-32-546',
      }
    }
    elsif !($facts['windows_server_type'] == 'windowsdc') {
      if($facts['windows_type'] =~ /(0|2)/) {
        #standalone
        local_security_policy { 'Deny log on as a batch job':
          ensure         => 'present',
          policy_setting => 'SeDenyBatchLogonRight',
          policy_type    => 'Privilege Rights',
          policy_value   => '*S-1-5-32-546',
        }
      }
    elsif ($facts['windows_type'] =~ /(1|3)/) {
      #member server
      local_security_policy { 'Deny log on as a batch job':
        ensure         => 'present',
        policy_setting => 'SeDenyBatchLogonRight',
        policy_type    => 'Privilege Rights',
        policy_value   => 'Domain Admins,Enterprise Admins,*S-1-5-32-546',
      }
    }
  }
}
}
