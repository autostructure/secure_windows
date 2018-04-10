# V-73533
# Local users on domain-joined computers must not be enumerated.
class secure_windows::stig::v73533 (
  Boolean $enforced = false,
) {
  if $enforced {

    registry::value { 'v73533':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System',
      value => 'EnumerateLocalUsers',
      type  => 'dword',
      data  => '0x00000000',
    }

}
