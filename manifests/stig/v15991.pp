# This class manages V-15991
# UIAccess applications must not be allowed to prompt for elevation without using the secure desktop.

class secure_windows::stig::v15991 (
  Boolean $enforced = true,
) {

  if $enforced {
    if ($facts['windows_role'] and
        $facts['windows_role'] =~ /(^35|,35,|,35$)/) {
        registry::value { 'v15991':
          key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System',
          value => 'EnableUIADesktopToggle',
          type  => 'dword',
          data  => '0x00000000',
        }
    }
  }
}
