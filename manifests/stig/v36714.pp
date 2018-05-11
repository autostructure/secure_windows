# This class manages V-36714
# The Windows Remote Management (WinRM) client must not use Digest authentication.
class secure_windows::stig::v36714 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v36714':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WinRM\Client',
      value => 'AllowDigest',
      type  => 'dword',
      data  => '0x00000000',
    }
  }
}
