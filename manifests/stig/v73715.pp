# V-73715
# User Account Control must be configured to detect application installations and prompt for elevation.
class secure_windows::stig::v73715 (
  Boolean $enforced = false,
) {

  if $enforced {
    if ($facts['windows_role'] and
        $facts['windows_role'] =~ /(^35|,35,|,35$)/) {
        registry::value { 'v73715':
          key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System',
          value => 'EnableInstallerDetection',
          type  => 'dword',
          data  => '0x00000001',
        }
    }
  }

}
