# This class manages V-15701
# A system restore point allows a rollback if an issue is encountered when a new device driver is installed.
class secure_windows::stig::v15701 (
  Boolean $enforced = true,
) {
  if $enforced {

    registry::value { 'v15701':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\DeviceInstall\Settings',
      value => 'DisableSystemRestore',
      type  => 'dword',
      data  => '0x00000000',
    }

  }
}
