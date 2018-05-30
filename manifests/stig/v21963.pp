# This class manages V-21963
# Windows Update must be prevented from searching for point and print drivers.
class secure_windows::stig::v21963 (
  Boolean $enforced = true,
) {

  if $enforced {

    registry::value { 'v21963':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Printers',
      value => 'DoNotInstallCompatibleDriverFromWindowsUpdate',
      type  => 'dword',
      data  => '1',
    }

  }

}
