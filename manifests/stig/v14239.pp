#This class manages V-14239
#User Account Control must only elevate UIAccess applications that are installed in secure locations.
class secure_windows::stig::v14239 (
  Boolean $enforced = true,
) {

  if $enforced {
    if ($facts['windows_role'] and
        $facts['windows_role'] =~ /(^35|,35,|,35$)/) {
        registry::value { 'v14239':
          key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System',
          value => 'EnableSecureUIAPaths',
          type  => 'dword',
          data  => '0x00000001',
        }
    }
  }

}
