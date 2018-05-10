# This class manages V-36698
# The use of biometrics must be disabled.
class secure_windows::stig::v36698 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v36698':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Biometrics',
      value => 'Enabled',
      type  => 'dword',
      data  => '0x00000000',
    }
  }
}
