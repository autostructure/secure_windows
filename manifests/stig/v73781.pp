# This class manages:
# V-73781
# The Force shutdown from a remote system user right must only be assigned to the Administrators group.
class secure_windows::stig::v73781 (
  Boolean $enforced = false,
) {
  if $enforced {
    local_security_policy { 'Force shutdown from a remote system':
      ensure         => 'present',
      policy_setting => 'SeRemoteShutdownPrivilege',
      policy_type    => 'Privilege Rights',
      policy_value   => '*S-1-5-32-544',
    }
  }
}
