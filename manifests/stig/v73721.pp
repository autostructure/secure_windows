# V-73721
# User Account Control must virtualize file and registry write failures to per-user locations.
class secure_windows::stig::v73721 (
  Boolean $enforced = false,
) {

  if $enforced {
    if ($facts['windows_role'] and
        $facts['windows_role'] =~ /(^35|,35,|,35$)/) {
        registry::value { 'v73721':
          key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System',
          value => 'EnableVirtualization',
          type  => 'dword',
          data  => '0x00000001',
        }
    }
  }

}
