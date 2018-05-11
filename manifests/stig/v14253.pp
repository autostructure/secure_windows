#This class manages V-14253
#Unauthenticated RPC clients must be restricted from connecting to the RPC server.
class secure_windows::stig::v14253 (
  Boolean $enforced = true,
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
