# This class manages V-6833
# The Windows SMB server must be configured to always perform SMB packet signing.
class secure_windows::stig::v6833 (
  Boolean $enforced = true,
) {
  if $enforced {

    registry_value { 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters\RequireSecuritySignature':
      ensure => present,
      type   => 'dword',
      data   => '0x00000001',
    }
  }
}
