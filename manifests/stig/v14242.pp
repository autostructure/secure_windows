#This class manages V-14242
#User Account Control must virtualize file and registry write failures to per-user locations.
class secure_windows::stig::v14242 (
  Boolean $enforced = true,
) {

  if $enforced {
    if ($facts['windows_role'] and
        $facts['windows_role'] =~ /(^35|,35,|,35$)/) {
        registry::value { 'v14242':
          key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System',
          value => 'EnableVirtualization',
          type  => 'dword',
          data  => '0x00000001',
        }
    }
  }

}
