# V-73675
# Anonymous access to Named Pipes and Shares must be restricted.
class secure_windows::stig::v73675 (
  Boolean $enforced = false,
) {

  if $enforced {

    registry::value { 'v73675':
      key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanManServer\Parameter',
      value => 'RestrictNullSessAccess',
      type  => 'dword',
      data  => '0x00000001',
    }

  }

}
