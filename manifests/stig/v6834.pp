# This class manages V-6834
# Anonymous access to Named Pipes and Shares must be restricted.
class secure_windows::stig::v6834 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v6834':
      key   => 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters',
      value => 'RestrictNullSessAccess',
      type  => 'dword',
      data  => '0x00000001',
    }
  }
}
