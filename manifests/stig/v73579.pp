# V-73579
# Basic authentication for RSS feeds over HTTP must not be used.
class secure_windows::stig::v73579 (
  Boolean $enforced = false,
) {
  if $enforced {

    registry::value { 'v73579':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Internet Explorer\Feeds',
      value => 'AllowBasicAuthInClear',
      type  => 'dword',
      data  => '0x00000000',
    }
  }
}
