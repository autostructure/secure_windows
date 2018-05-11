# This class manages V-15685
# This setting prevents users from changing installation options that may bypass security features.
class secure_windows::stig::v15685 (
  Boolean $enforced = true,
) {
  if $enforced {

    registry::value { 'v15685':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Installer',
      value => 'EnableUserControl',
      type  => 'dword',
      data  => '0x00000000',
    }

  }
}
