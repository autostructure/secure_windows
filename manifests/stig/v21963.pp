# This class manages V-21963
# Windows Update must be prevented from searching for point and print drivers.
class secure_windows::stig::v21963 (
  Boolean $enforced = true,
) {

  if $enforced {

      registry_value { 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Printers\DoNotInstallCompatibleDriverFromWindowsUpdate':
        ensure => present,
        type   => 'dword',
        data   => '0x00000001',
      }
    }
  }
