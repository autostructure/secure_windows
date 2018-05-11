# This class manages V-36708
# The location feature must be turned off.
class secure_windows::stig::v36708 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v36708':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\LocationAndSensors',
      value => 'DisableLocation',
      type  => 'dword',
      data  => '0x00000001',
    }
  }
}
