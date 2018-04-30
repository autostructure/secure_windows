# V-73709
# UIAccess applications must not be allowed to prompt for elevation without using the secure desktop.
class secure_windows::stig::v73709 (
  Boolean $enforced = false,
) {

  if $enforced {
    if ($facts['windows_role'] and
        $facts['windows_role'] =~ /(^35|,35,|,35$)/) {
        registry::value { 'v73709':
          key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System',
          value => 'EnableUIADesktopToggle',
          type  => 'dword',
          data  => '0x00000000',
        }
    }
  }

}
