# This class manages V-1090
# Caching of logon credentials must be limited.

class secure_windows::stig::v1090 (
  Boolean $enforced = true,
) {

  if $enforced {
    if($facts['windows_type'] =~ /(1|3)/) {
      registry::value { 'v1090':
        key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon',
        value => 'CachedLogonsCount',
        type  => 'string',
        data  => '4',
      }
    }
  }
}
