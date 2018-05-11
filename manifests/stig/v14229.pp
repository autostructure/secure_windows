#This class manages V-14229
#Auditing of Backup and Restore Privileges must be turned off
class auto_structure::stig::v14229 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { '14229':
      key   => 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa',
      value => 'FullPrivilegeAuditing',
      type  => 'binary',
      data  => '0',
    }

  }
}
