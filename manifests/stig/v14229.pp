#This class manages V-14229
#Auditing of Backup and Restore Privileges must be turned off
class secure_windows::stig::v14229 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v14229':
      key   => 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa',
      value => 'FullPrivilegeAuditing',
      type  => 'binary',
      data  => '0',
    }

  }
}
