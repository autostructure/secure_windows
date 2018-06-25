# This class manages V-15680
# The classic logon screen must be required for user logons.

class secure_windows::stig::v15680 (
  Boolean $enforced = true,
) {
  if $enforced {
    if !($facts['windows_server_type'] == 'windowsdc') {

  registry::value { 'v15680':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System',
    value => 'LogonType',
    type  => 'dword',
    data  => '0',
      }
    }
  }
}
