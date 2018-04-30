# V-73713
# User Account Control must automatically deny standard user requests for elevation.
class secure_windows::stig::v73713 (
  Boolean $enforced = false,
) {

  if $enforced {
    if ($facts['windows_role'] and
        $facts['windows_role'] =~ /(^35|,35,|,35$)/) {
        registry::value { 'v73713':
          key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System',
          value => 'ConsentPromptBehaviorUser',
          type  => 'dword',
          data  => '0x00000000',
        }
    }
  }

}
