#This class manages V-1145
#Automatic logons must be disabled
class secure_windows::stig::v1145 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v1145':
      key   => 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon',
      value => 'AutoAdminLogon',
      type  => 'string',
      data  => '0',
    }

  }
}
