# V-73711
# User Account Control must, at a minimum, prompt administrators for consent on the secure desktop.
class secure_windows::stig::v73711 (
  Boolean $enforced = false,
) {

  if $enforced {

    registry::value { 'v73711':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System',
      value => 'ConsentPromptBehaviorAdmin',
      type  => 'dword',
      data  => '0x00000002',
    }

  }

}
