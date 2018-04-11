# V-73651
# Caching of logon credentials must be limited.
class secure_windows::stig::v73651 (
  Boolean $enforced = false,
) {

  if $enforced {

    registry::value { 'v73651':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon',
      value => 'CachedLogonsCount',
      type  => 'string',
      data  => '4',
    }

  }

}
