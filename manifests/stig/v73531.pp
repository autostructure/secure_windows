# V-73531
# The network selection user interface (UI) must not be displayed on the logon screen.
class secure_windows::stig::v73531 (
  Boolean $enforced = false,
) {

  if $enforced {

    registry::value { 'v73531':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System',
      value => 'DontDisplayNetworkSelectionUI',
      type  => 'dword',
      data  => '0x00000001',
    }

  }

}
