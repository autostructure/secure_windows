# V-73541
# Unauthenticated Remote Procedure Call (RPC) clients must be restricted from connecting to the RPC server.
class secure_windows::stig::v73541 (
  Boolean $enforced = false,
) {

  if $enforced {

    registry::value { 'v73541':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Rpc',
      value => 'RestrictRemoteClients',
      type  => 'dword',
      data  => '0x00000001',
    }

  }

}
