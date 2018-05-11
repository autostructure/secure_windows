#This class manages V-14235
#User Account Control must, at minimum, prompt administrators for consent.
class secure_windows::stig::v14235 (
  Boolean $enforced = true,
) {

  if $enforced {
    if ($facts['windows_role'] and
        $facts['windows_role'] =~ /(^35|,35,|,35$)/) {
        registry::value { 'v14235':
          key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System',
          value => 'ConsentPromptBehaviorAdmin',
          type  => 'dword',
          data  => '0x00000002',
        }
    }
  }
}
