# V-73495
# Local administrator accounts must have their privileged token filtered to prevent elevated privileges from being used over the network on domain systems.
class secure_windows::stig::v73495 (
  Boolean $enforced = false,
) {
  if $enforced {
    registry::value { 'v73495':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System',
      value => 'LocalAccountTokenFilterPolicy',
      type  => 'dword',
      data  => '0x00000000',
    }
  }
}
