# This class manages V-28504
# Windows must be prevented from sending an error report when a device driver requests additional software during installation.

class secure_windows::stig::v28504 (
  Boolean $enforced = true,
  ) {
    if $enforced {

      registry::value { 'v28504':
        key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\DeviceInstall\Settings',
        value => 'DisableSendRequestAdditionalSoftwareToWER',
        type  => 'dword',
        data  => '1',
      }

    }

  }
