# This class manages V-36713
# The Windows Remote Management (WinRM) client must not allow unencrypted traffic.
class secure_windows::stig::v36713 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v36713':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WinRM\Client',
      value => 'AllowUnencryptedTraffic',
      type  => 'dword',
      data  => '0x00000000',
    }
  }
}
