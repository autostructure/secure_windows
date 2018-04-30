# V-73515
# Credential Guard must be running on domain-joined systems.
class secure_windows::stig::v73515 (
  Boolean $enforced = false,
  Enum['lock','no lock'] $lsacfgflags = 'lock',
) {

  if $enforced {
    if($facts['windows_type'] =~ /(1|3|4|5)/) {
      $lsacfgflagsval = $lsacfgflags ? {
        'lock'    => '0x00000001',
        'no lock' => '0x00000002',
      }

      registry::value { 'v73515':
        key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard',
        value => 'LsaCfgFlags',
        type  => 'dword',
        data  => $lsacfgflagsval,
      }
    }
  }

}
