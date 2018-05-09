#This class manages V-1155
#The Deny access to this computer from the network user right on member servers must be configured to prevent access
#from highly privileged domain accounts and local accounts on domain systems, and from unauthenticated access on all systems.
class secure_windows::stig::v1155 (
  Boolean $enforced = true,
) {
  if $enforced {
    if !($facts['windows_server_type'] == 'windowsdc') {
      if($facts['windows_type'] =~ /(0|2)/) {
        #standalone
        local_security_policy { 'Deny access to this computer from the network':
          ensure         => 'present',
          policy_setting => 'SeDenyNetworkLogonRight',
          policy_type    => 'Privilege Rights',
          policy_value   => '*S-1-5-32-546',
        }
      }
      elsif ($facts['windows_type'] =~ /(1|3)/) {
        #member server
        local_security_policy { 'Deny access to this computer from the network':
          ensure         => 'present',
          policy_setting => 'SeDenyNetworkLogonRight',
          policy_type    => 'Privilege Rights',
          policy_value   => 'Domain Admins,Enterprise Admins,*S-1-5-32-546,*S-1-5-114',
        }
      }
    }
  }
}
