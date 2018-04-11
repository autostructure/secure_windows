# V-73587
# Users must be notified if a web-based program attempts to install software.
class secure_windows::stig::v73587 (
  Boolean $enforced = false,
) {

  if $enforced {

    registry::value { 'v73587':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Installer',
      value => 'SafeForScripting',
      type  => 'dword',
      data  => '0x00000000',
    }

  }

}
