# This class manages V-30016
# Unauthorized accounts must not have the Add workstations to domain user right.
class secure_windows::stig::v30016 (
  Boolean $enforced = true,
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
