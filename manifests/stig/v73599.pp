# V-73599
# The Windows Remote Management (WinRM) service must not use Basic authentication.
class secure_windows::stig::v73599 (
  Boolean $enforced = false,
) {

  if $enforced {

    registry::value { 'v73599':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service',
      value => 'AllowBasic',
      type  => 'dword',
      data  => '0x00000000',
    }

  }

}
