# This class manages V-4447
# The Remote Desktop Session Host must require secure RPC communications.
class secure_windows::stig::v4447 (
  Boolean $enforced = true,
) {
  if $enforced {

    registry_value { 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Terminal Services\fEncryptRPCTraffic':
      ensure => present,
      type   => 'dword',
      data   => '0x00000001',
    }
  }
}
