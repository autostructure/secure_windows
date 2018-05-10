# This class manages V-36722
# Permissions for the Application event log must prevent access by nonprivileged accounts.
# This class manages V-36723
# Permissions for the Security event log must prevent access by nonprivileged accounts.
# This class manages V-36724
# Permissions for the System event log must prevent access by nonprivileged accounts.
class secure_windows::stig::v36722 (
  Boolean $enforced = true,
) {
  if $enforced {
    $system_root = $facts['os']['windows']['system32']

    acl { [ "${system_root}\\winevt\\Logs\\Application.evtx",
            "${system_root}\\winevt\\Logs\\Security.evtx",
            "${system_root}\\winevt\\Logs\\System.evtx",
          ]:
      inherit_parent_permissions => false,
      permissions                => [
        {
          'identity' => 'NT SERVICE\\EventLog',
          'rights'   => ['full'],
          'affects'  => 'self_only',
        },
        {
          'identity' => 'S-1-5-18',
          'rights'   => ['full'],
          'affects'  => 'self_only',
        },
        {
          'identity' => 'S-1-5-32-544',
          'rights'   => ['full'],
          'affects'  => 'self_only',
        }
      ],
    }
  }
}
