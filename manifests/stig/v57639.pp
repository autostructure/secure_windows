# This class manages V-57639
# Users must be required to enter a password to access private keys stored on the computer.
class secure_windows::stig::v57639 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v57639':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Cryptography',
      value => 'ForceKeyProtection',
      type  => 'dword',
      data  => '0x00000002',
    }
  }
}
