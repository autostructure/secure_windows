# This class manages:
# V-73737
# The Add workstations to domain user right must only be assigned to the Administrators group.
class secure_windows::stig::v73737 (
  Boolean $enforced = false,
) {
  if $enforced {
    if($facts['windows_server_type'] == 'windowsdc') {
      local_security_policy { 'Add workstations to domain':
        ensure         => 'present',
        policy_setting => 'SeMachineAccountPrivilege',
        policy_type    => 'Privilege Rights',
        policy_value   => '*S-1-5-32-544',
      }
    }
  }
}
