# This class manages V-34974
# The Windows Installer Always install with elevated privileges option must be disabled.
class secure_windows::stig::v34974 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v34974':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Installer',
      value => 'AlwaysInstallElevated',
      type  => 'dword',
      data  => '0x00000000',
    }
  }
}
