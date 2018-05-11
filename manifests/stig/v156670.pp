# This class manages V-15667
# Setting prevents a Network Bridge from being installed and configured.
class secure_windows::stig::v15667 (
  Boolean $enforced = true,
) {
  if $enforced {

    registry::value { 'v15667':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Network Connections',
      value => 'NC_AllowNetBridge_NLA',
      type  => 'dword',
      data  => '0x00000000',
    }

  }
}
