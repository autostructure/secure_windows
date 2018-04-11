# V-73725
# The screen saver must be password protected.
class secure_windows::stig::v73725 (
  Boolean $enforced = false,
) {

  if $enforced {

    registry::value { 'v73725':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Control Panel\Desktop',
      value => 'ScreenSaverIsSecure',
      type  => 'string',
      data  => '1',
    }

  }

}
