#This class manages V-1171
#Ejection of removable NTFS media must be restricted to Administrators.
class secure_windows::stig::v1171 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v1171':
      key   => 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon',
      value => 'AllocateDASD',
      type  => 'string',
      data  => '0',
    }

  }
}
