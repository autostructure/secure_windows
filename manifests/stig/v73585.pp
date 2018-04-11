# V-73585
# The Windows Installer Always install with elevated privileges option must be disabled.
class secure_windows::stig::v73585 (
  Boolean $enforced = false,
) {

  if $enforced {

    registry::value { 'v73585':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Installer',
      value => 'AlwaysInstallElevated',
      type  => 'dword',
      data  => '0x00000000',
    }

  }

}
