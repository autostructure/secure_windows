# This class manages V-15700
# Remote access to the Plug and Play interface could potentially allow connections by unauthorized devices.
# This setting configures remote access to the Plug and Play interface and must be disabled.
class secure_windows::stig::v15700 (
  Boolean $enforced = true,
) {
  if $enforced {

    registry::value { 'v15700':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\DeviceInstall\Settings',
      value => 'AllowRemoteRPC',
      type  => 'dword',
      data  => '0x00000000',
    }

  }
}
