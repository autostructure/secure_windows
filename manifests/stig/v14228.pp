#This class manages V-14228
#Auditing the Access of Global System Objects must be turned off.
class secure_windows::stig::v14228 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v14228':
      key   => 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa',
      value => 'DontDisplayLastUserName',
      type  => 'dword',
      data  => '0',
    }

  }
}
