# This class manages V-43245
# Automatically signing in the last interactive user after a system-initiated restart must be disabled (Windows 2012 R2).
class secure_windows::stig::v43245 (
  Boolean $enforced = true,
) {
  if $enforced {
    if $facts['operatingsystemmajrelease'] == '2012 R2' {
      registry::value { 'v43245':
        key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System',
        value => 'DisableAutomaticRestartSignOn',
        type  => 'dword',
        data  => '0x00000001',
      }
    }
  }
}
