# This class manages V-36679
# Early Launch Antimalware, Boot-Start Driver Initialization Policy must be enabled and configured to only Good and Unknown.
class secure_windows::stig::v36679 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v36679':
      key   => 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Policies\EarlyLaunch',
      value => 'DriverLoadPolicy',
      type  => 'dword',
      data  => '0x00000001',
    }
  }
}
