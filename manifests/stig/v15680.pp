# This class manages V-15680
# The classic logon screen must be required for user logons.

class secure_windows::stig::v15680 (
  Boolean $enforced = true,
) {
  if $enforced {
    if !($facts['windows_server_type'] == 'windowsdc') {

      registry_value { 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\LogonType':
        ensure => present,
        type   => 'dword',
        data   => '0',
      }
    }
  }
}
