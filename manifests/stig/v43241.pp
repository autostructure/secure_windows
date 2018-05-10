# This class manages V-43241
# The setting to allow Microsoft accounts to be optional for modern style apps must be enabled (Windows 2012 R2).
class secure_windows::stig::v43241 (
  Boolean $enforced = true,
) {
  # if $enforced {
  #   if $facts['operatingsystemmajrelease'] == '2012 R2' {
  #     registry::value { 'v43241':
  #       key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System',
  #       value => 'test',
  #       type  => 'dword',
  #       data  => '0x00000001',
  #     }
  #   }
  # }
  # Known bug that has been submitted to Puppet with no fix
}
