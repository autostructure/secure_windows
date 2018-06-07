# This class manages V-6834
# Anonymous access to Named Pipes and Shares must be restricted.
class secure_windows::stig::v6834 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry_value { 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters\RestrictNullSessAccess':
      ensure => present,
      type   => 'dword',
      data   => '0x00000001',
    }
  }
}
