# V-73603
# The Windows Remote Management (WinRM) service must not store RunAs credentials.
class secure_windows::stig::v73603 (
  Boolean $enforced = false,
) {

  if $enforced {

    registry::value { 'v73603':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service',
      value => 'DisableRunAs',
      type  => 'dword',
      data  => '0x00000001',
    }

  }

}
