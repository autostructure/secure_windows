#This class manages V-14230
#Audit policy using subcategories must be enabled
class secure_windows::stig::v14230 (
  Boolean $enforced = true,
) {

  if $enforced {

    registry::value { 'v14230':
      key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa',
      value => 'SCENoApplyLegacyAuditPolicy',
      type  => 'dword',
      data  => '0x00000001',
    }

  }

}
