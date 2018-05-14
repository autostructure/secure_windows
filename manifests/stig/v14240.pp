#This class manages V-14240
#User Account Control must run all administrators in Admin Approval Mode, enabling UAC
class secure_windows::stig::v14240 (
  Boolean $enforced = true,
) {

  if $enforced {
    if ($facts['windows_role'] and
        $facts['windows_role'] =~ /(^35|,35,|,35$)/) {
      registry::value { 'v14240':
        key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System',
        value => 'EnableLUA',
        type  => 'dword',
        data  => '0x00000001',
      }
    }
  }

}
