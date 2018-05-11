# This class manages V-36700
# The password reveal button must not be displayed.
class secure_windows::stig::v36700 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v36700':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\CredUI',
      value => 'DisablePasswordReveal',
      type  => 'dword',
      data  => '0x00000001',
    }
  }
}
