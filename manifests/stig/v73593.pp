# V-73593
# The Windows Remote Management (WinRM) client must not use Basic authentication.
class secure_windows::stig::v73593 (
  Boolean $enforced = false,
) {

  if $enforced {

    registry::value { 'v73593':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client',
      value => 'AllowBasic',
      type  => 'dword',
      data  => '0x00000000',
    }

  }

}
