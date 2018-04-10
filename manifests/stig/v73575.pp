# V-73575
# Remote Desktop Services must be configured with the client connection encryption set to High Level.
class secure_windows::stig::v73575 (
  Boolean $enforced = false,
) {
  if $enforced {

    registry::value { 'v73575':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services',
      value => 'MinEncryptionLevel',
      type  => 'dword',
      data  => '0x00000003',
    }

}
