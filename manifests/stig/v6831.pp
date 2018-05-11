# This class manages V-6831
# Outgoing secure channel traffic must be encrypted or signed.
class secure_windows::stig::v6831 (
  Boolean $enforced = true,
) {
  if $enforced {
    # registry::value { 'v6831':
    #   key   => 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters',
    #   value => 'RequireSignOrSeal',
    #   type  => 'dword',
    #   data  => '0x00000001',
    # }
    registry_value { 'HKLM\System\CurrentControlSet\Services\Netlogon\Parameters\RequireSignOrSeal':
      ensure => present,
      type   => dword,
      data   => '0x00000001',
    }
  }
}
