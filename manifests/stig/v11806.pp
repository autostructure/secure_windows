#This class manages V-11806
#The system must be configured to prevent the display of the last username on the logon screen.
class secure_windows::stig::v11806 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v11806':
      key   => 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System',
      value => 'DontDisplayLastUserName',
      type  => 'dword',
      data  => '1',
    }

  }
}
