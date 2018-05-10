# This class manages V-36684
# Local users on domain-joined computers must not be enumerated.
class secure_windows::stig::v36684 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v36684':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\System',
      value => 'EnumerateLocalUsers',
      type  => 'dword',
      data  => '0x00000000',
    }
  }
}
