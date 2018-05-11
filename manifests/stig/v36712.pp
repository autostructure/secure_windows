# This class manages V-36712
# The Windows Remote Management (WinRM) client must not use Basic authentication.
class secure_windows::stig::v36712 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v36712':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WinRM\Client',
      value => 'AllowBasic',
      type  => 'dword',
      data  => '0x00000000',
    }
  }
}
