# V-73723
# A screen saver must be enabled on the system.
class secure_windows::stig::v73723 (
  Boolean $enforced = false,
) {

  if $enforced {

    registry::value { 'v73723':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Control Panel\Desktop',
      value => 'ScreenSaveActive',
      type  => 'string',
      data  => '1',
    }

  }

}
