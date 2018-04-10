# V-73627
# Audit policy using subcategories must be enabled.
class secure_windows::stig::v73627 (
  Boolean $enforced = false,
) {

  if $enforced {

    registry::value { 'v73627':
      key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa',
      value => 'SCENoApplyLegacyAuditPolicy',
      type  => 'dword',
      data  => '0x00000001',
    }

  }

}
