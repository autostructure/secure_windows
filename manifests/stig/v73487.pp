# V-73487
# Administrator accounts must not be enumerated during elevation.
class secure_windows::stig::v73487 (
  Boolean $enforced = false,
) {
  if $enforced {
    registry::value { 'v73487':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\CredUI',
      value => 'EnumerateAdministrators',
      type  => 'dword',
      data  => '0x00000000',
    }
  }
}
