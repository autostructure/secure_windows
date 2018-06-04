# This class manages V-26484
# (Domain Controller)
# The Deny log on as a service user right must be configured to include no accounts or groups (blank) on domain controllers.
# (Member Servers)
# The Deny log on as a service user right on member servers must be configured to prevent access from highly privileged domain accounts
# on domain systems. No other groups or accounts must be assigned this right.

class secure_windows::stig::v26484 (
  Boolean $enforced = true,
) {
  if $enforced {
    if($facts['windows_server_type'] == 'windowsdc') {
      #domain controller
      local_security_policy { 'Deny log on as a service':
        ensure         => 'absent',
      }
    }
    elsif !($facts['windows_server_type'] == 'windowsdc') {
      if($facts['windows_type'] =~ /(0|2)/) {
        #standalone
        local_security_policy { 'Deny log on as a service':
          ensure         => 'absent',
        }
      }
      elsif ($facts['windows_type'] =~ /(1|3)/) {
        #member server
        local_security_policy { 'Deny log on as a service':
          ensure         => 'present',
          policy_setting => 'SeDenyServiceLogonRight',
          policy_type    => 'Privilege Rights',
          policy_value   => 'Domain Admins,Enterprise Admins',
        }
      }
    }
  }
}
