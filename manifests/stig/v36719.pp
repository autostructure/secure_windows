# This class manages V-36719
# The Windows Remote Management (WinRM) service must not allow unencrypted traffic.
class secure_windows::stig::v36719 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v36719':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WinRM\Service',
      value => 'AllowUnencryptedTraffic',
      type  => 'dword',
      data  => '0x00000000',
    }
  }
}
