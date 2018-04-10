# This class manages:
# V-73753
# The Create symbolic links user right must only be assigned to the Administrators group.
class secure_windows::stig::v73753 (
  Boolean $enforced = false,
) {
  if $enforced {
    if ($facts['windows_role'] and
        $facts['windows_role'] =~ /(^20|,20,|,20$)/) {
      local_security_policy { 'Create symbolic links':
        ensure         => 'present',
        policy_setting => 'SeCreateSymbolicLinkPrivilege',
        policy_type    => 'Privilege Rights',
        policy_value   => '*S-1-5-32-544,*S-1-5-83-0',
      }
    }
    else {
      local_security_policy { 'Create symbolic links':
        ensure         => 'present',
        policy_setting => 'SeCreateSymbolicLinkPrivilege',
        policy_type    => 'Privilege Rights',
        policy_value   => '*S-1-5-32-544',
      }
    }
  }
}
