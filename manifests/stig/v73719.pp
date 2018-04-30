# V-73719
# User Account Control must run all administrators in Admin Approval Mode, enabling UAC.
class secure_windows::stig::v73719 (
  Boolean $enforced = false,
) {

  if $enforced {
    if ($facts['windows_role'] and
        $facts['windows_role'] =~ /(^35|,35,|,35$)/) {
      registry::value { 'v73719':
        key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System',
        value => 'EnableLUA',
        type  => 'dword',
        data  => '0x00000001',
      }
    }
  }

}
