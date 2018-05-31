# This class manages V-15683
# The shell protocol will limit the set of folders applications can open when run in protected mode.
# Restricting files an application can open to a limited set of folders increases the security of Windows.
class secure_windows::stig::v15683 (
  Boolean $enforced = true,
) {
  if $enforced {

    registry_value { 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\PreXPSP2ShellProtocolBehavior':
      ensure => present,
      type   => 'dword',
      data   => '0',
      }
    }
  }
