# This class manages V-43241
#
class secure_windows::stig::v43241 (
  Boolean $enforced = true,
) {
  if $enforced {
    if $facts['operatingsystemmajrelease'] == '2012 R2' {
      registry::value { 'v43241':
        key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System',
        value => 'MSAOptional',
        type  => 'dword',
        data  => '0x00000001',
      }
    }
  }
}
