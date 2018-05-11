# This class manages V-72753
# WDigest Authentication must be disabled.
class secure_windows::stig::v72753 (
  Boolean $enforced = true,
) {
  if $enforced {
    include ::secure_windows::administrative_template_secguide_installer

    registry::value { 'v72753':
      key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\Wdigest',
      value => 'UseLogonCredential',
      type  => 'dword',
      data  => '0x00000000',
    }
  }
}
