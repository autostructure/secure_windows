# V-73583
# Users must be prevented from changing installation options.
class secure_windows::stig::v73583 (
  Boolean $enforced = false,
) {
  if $enforced {

    registry::value { 'v73583':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Installer',
      value => 'EnableUserControl',
      type  => 'dword',
      data  => '0x00000000',
    }

}
