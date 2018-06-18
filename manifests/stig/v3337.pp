# This class manages V-3337
# Anonymous SID/Name translation must not be allowed.

class secure_windows::stig::v3337 (
  Boolean $enforced = true,
) {
  if $enforced {
    local_security_policy { 'Network access: Allow anonymous SID/name translation':
      ensure         => 'present',
      policy_setting => 'LSAAnonymousNameLookup',
      policy_type    => 'System Access',
      policy_value   => '0',
    }
  }
}
