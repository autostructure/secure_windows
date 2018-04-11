# V-73597
# The Windows Remote Management (WinRM) client must not use Digest authentication.
class secure_windows::stig::v73597 (
  Boolean $enforced = false,
) {

  if $enforced {

    registry::value { 'v73597':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client',
      value => 'AllowDigest',
      type  => 'dword',
      data  => '0x00000000',
    }

  }

}
