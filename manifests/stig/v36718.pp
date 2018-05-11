# This class manages V-36718
# The Windows Remote Management (WinRM) service must not use Basic authentication.
class secure_windows::stig::v36718 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v36718':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WinRM\Service',
      value => 'AllowBasic',
      type  => 'dword',
      data  => '0x00000000',
    }
  }
}
