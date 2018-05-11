# This class manages V-36720
# The Windows Remote Management (WinRM) service must not store RunAs credentials.
class secure_windows::stig::v36720 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v36720':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WinRM\Service',
      value => 'DisableRunAs',
      type  => 'dword',
      data  => '0x00000001',
    }
  }
}
