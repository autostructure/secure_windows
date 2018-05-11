# This class manags V-36677
# Optional component installation and component repair must be prevented from using Windows Update.
class secure_windows::stig::v36677 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v36677':
      key   => 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Servicing',
      value => 'UseWindowsUpdate',
      type  => 'dword',
      data  => '0x00000002',
    }
  }
}
