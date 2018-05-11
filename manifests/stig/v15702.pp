# This class manages V-15702
# This setting prevents an error report from being sent when a generic device driver is installed.
class secure_windows::stig::v15702 (
  Boolean $enforced = true,
) {
  if $enforced {

    registry::value { 'v15702':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\DeviceInstall\Settings',
      value => 'DisableSendGenericDriverNotFoundToWER',
      type  => 'dword',
      data  => '0x00000001',
    }

  }
}
