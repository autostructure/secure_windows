# V-73709
# UIAccess applications must not be allowed to prompt for elevation without using the secure desktop.
class secure_windows::stig::v73709 (
  Boolean $enforced = false,
) {

  if $enforced {

    registry::value { 'v73709':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System',
      value => 'EnableUIADesktopToggle',
      type  => 'dword',
      data  => '0x00000000',
    }

  }

}
