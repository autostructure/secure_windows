# This class manages V-6832
# The Windows SMB client must be configured to always perform SMB packet signing.
class secure_windows::stig::v6832 (
  Boolean $enforced = true,
) {
  if $enforced {
    # registry::value { 'v6832':
    #   key   => 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanmanWorkstation\Parameters',
    #   value => 'RequireSecuritySignature',
    #   type  => 'dword',
    #   data  => '0x00000001',
    # }
    registry_value { 'HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters\RequireSecuritySignature':
      ensure => present,
      type   => dword,
      data   => '0x00000001',
    }
  }
}
