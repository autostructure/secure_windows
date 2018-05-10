#This class manages V-1172
#Users must be warned in advance of their passwords expiring
class secure_windows::stig::v1172 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v1172':
      key   => 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon',
      value => 'PasswordExpiryWarning',
      type  => 'string',
      data  => '15',
    }

  }
}
