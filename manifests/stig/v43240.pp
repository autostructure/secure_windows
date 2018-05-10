# This class manages V-43240
# The network selection user interface (UI) must not be displayed on the logon screen (Windows 2012 R2).
class secure_windows::stig::v43240 (
  Boolean $enforced = true,
) {
  if $enforced {
    if $facts['operatingsystemmajrelease'] == '2012 R2' {
      registry::value { 'v43240':
        key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System',
        value => 'DontDisplayNetworkSelectionUI',
        type  => 'dword',
        data  => '0x00000001',
      }
    }
  }
}
