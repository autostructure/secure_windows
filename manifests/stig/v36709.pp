# This class manages V-36709
# Basic authentication for RSS feeds over HTTP must be turned off.
class secure_windows::stig::v36709 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v36709':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Internet Explorer\Feeds',
      value => 'AllowBasicAuthInClear',
      type  => 'dword',
      data  => '0x00000000',
    }
  }
}
