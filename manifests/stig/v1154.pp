#This class manages V-1154
#The Ctrl+Alt+Del security attention sequence for logons must be enabled.
class secure_windows::stig::v1154 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v1154':
      key   => 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System',
      value => 'DisableCAD',
      type  => 'dword',
      data  => '0',
    }

  }
}
