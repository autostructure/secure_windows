# V-73541
# Unauthenticated Remote Procedure Call (RPC) clients must be restricted from connecting to the RPC server.
class secure_windows::stig::v73541 (
  Boolean $enforced = false,
) {

  if $enforced {
    if($facts['windows_type'] =~ /(0|1|2|3)/) {
      registry::value { 'v73541':
        key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Rpc',
        value => 'RestrictRemoteClients',
        type  => 'dword',
        data  => '0x00000001',
      }
    }

  }

}
