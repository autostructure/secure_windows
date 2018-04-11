# V-73721
# User Account Control must virtualize file and registry write failures to per-user locations.
class secure_windows::stig::v73721 (
  Boolean $enforced = false,
) {

  if $enforced {

    registry::value { 'v73721':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System',
      value => 'EnableVirtualization',
      type  => 'dword',
      data  => '0x00000001',
    }

  }

}
