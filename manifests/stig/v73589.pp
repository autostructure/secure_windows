# V-73589
# Automatically signing in the last interactive user after a system-initiated restart must be disabled.
class secure_windows::stig::v73589 (
  Boolean $enforced = false,
) {

  if $enforced {

    registry::value { 'v73589':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System',
      value => 'DisableAutomaticRestartSignOn',
      type  => 'dword',
      data  => '0x00000001',
    }

  }

}
