#This class manages V-1115
#The built-in administrator account must be renamed.
class secure_windows::stig::v1115 (
  Boolean $enforced = true,
  String $admin_account_name = 'adminaccount',
) {
  if $enforced {
    local_security_policy { 'Accounts: Rename administrator account':
      ensure         => 'present',
      policy_setting => 'NewAdministratorName',
      policy_type    => 'System Access',
      policy_value   => "\"${admin_account_name}\"",
    }
  }
}
