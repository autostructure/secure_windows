# V-73711
# User Account Control must, at a minimum, prompt administrators for consent on the secure desktop.
class secure_windows::stig::v73711 (
  Boolean $enforced = false,
) {

  if $enforced {
    if ($facts['windows_role'] and
        $facts['windows_role'] =~ /(^35|,35,|,35$)/) {
        registry::value { 'v73711':
          key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System',
          value => 'ConsentPromptBehaviorAdmin',
          type  => 'dword',
          data  => '0x00000002',
        }
    }
  }

}
