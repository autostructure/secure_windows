# V-73515
# Credential Guard must be running on domain-joined systems.
class secure_windows::stig::v73515 (
  Boolean $enforced = false,
) {

  if $enforced {

    registry::value { 'v73515':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard',
      value => 'LsaCfgFlags',
      type  => 'dword',
      data  => '0x00000001',
    }

  }

}
