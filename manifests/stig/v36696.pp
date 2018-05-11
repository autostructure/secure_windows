# This class manages V-36696
# The detection of compatibility issues for applications and drivers must be turned off.
class secure_windows::stig::v36696 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v36696':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\AppCompat',
      value => 'DisablePcaUI',
      type  => 'dword',
      data  => '0x00000000',
    }
  }
}
