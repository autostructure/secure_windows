#This class manages V-14230
#Audit policy using subcategories must be enabled
class secure_windows::stig::v14230 (
  Boolean $enforced = true,
) {

  if $enforced {

    registry_value { 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\SCENoApplyLegacyAuditPolicy':
      ensure => present,
      type   => 'dword',
      data   => '1',
      }
    }
  }
