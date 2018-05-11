#This class manages V-14243
#Administrator accounts must not be enumerated during elevation
class secure_windows::stig::v14243 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v14243':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\CredUI',
      value => 'EnumerateAdministrators',
      type  => 'dword',
      data  => '0x00000000',
    }
  }
}
