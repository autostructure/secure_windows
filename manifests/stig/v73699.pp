# V-73699
# Users must be required to enter a password to access private keys stored on the computer.
class secure_windows::stig::v73699 (
  Boolean $enforced = false,
) {

  if $enforced {

    registry::value { 'v73699':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Cryptography',
      value => 'ForceKeyProtection',
      type  => 'dword',
      data  => '0x00000002',
    }

  }

}
