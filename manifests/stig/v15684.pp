# This class manages V-15684
# This setting ensures users are notified if a web-based program attempts to install software.
class secure_windows::stig::v15684 (
  Boolean $enforced = true,
) {
  if $enforced {

    registry::value { 'v15684':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Installer',
      value => 'SafeForScripting',
      type  => 'dword',
      data  => '0x00000000',
    }

  }
}
