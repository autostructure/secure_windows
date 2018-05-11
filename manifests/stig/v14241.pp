#This class manages V-14241
#User Account Control must switch to the secure desktop when prompting for elevation.
class secure_windows::stig::v14241 (
  Boolean $enforced = true,
) {

  if $enforced {
    if ($facts['windows_role'] and
        $facts['windows_role'] =~ /(^35|,35,|,35$)/) {
        registry::value { 'v14241':
          key   => 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System',
          value => 'PromptOnSecureDesktop',
          type  => 'dword',
          data  => '1',
        }
    }
  }
}
