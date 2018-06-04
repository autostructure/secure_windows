# This class manages V-26488
# Unauthorized accounts must not have the Force shutdown from a remote system user right.

class secure_windows::stig::v26488 (
  Boolean $enforced = true,
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
