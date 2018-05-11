# This class manages V-3454
# Remote Desktop Services must be configured with the client connection encryption set to the required level.
class secure_windows::stig::v3454 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v3454':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Terminal Services',
      value => 'MinEncryptionLevel',
      type  => 'dword',
      data  => '3',
    }
  }
}
