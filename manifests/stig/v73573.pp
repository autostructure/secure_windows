# V-73573
# The Remote Desktop Session Host must require secure Remote Procedure Call (RPC) communications.
class secure_windows::stig::v73573 (
  Boolean $enforced = false,
) {
  if $enforced {

    registry::value { 'v73573':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services',
      value => 'fEncryptRPCTraffic',
      type  => 'dword',
      data  => '0x00000001',
    }

}
