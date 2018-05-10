#This class manages V-1136
#Users must be forcibly disconnected when their logon hours expire.
class secure_windows::stig::v1136 (
  Boolean $enforced = true,
) {
  if $enforced {
    local_security_policy { 'Network security: Force logoff when logon hours expire':
      ensure         => 'present',
      policy_setting => 'ForceLogoffWhenHourExpire',
      policy_type    => 'System Access',
      policy_value   => '1',
    }

  }

}
