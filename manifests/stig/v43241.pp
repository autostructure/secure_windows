# This class manages V-43241
# The setting to allow Microsoft accounts to be optional for modern style apps must be enabled (Windows 2012 R2).
class secure_windows::stig::v43241 (
  Boolean $enforced = true,
) {
  # if $enforced {
  #   if $facts['operatingsystemmajrelease'] == '2012 R2' {
  #     registry::value { 'v43241':
  #       key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System',
  #       value => 'MSAOptional',
  #       type  => 'dword',
  #       data  => '0x00000001',
  #     }
  #   }
  # }
  # Known bug that has been submitted to Puppet with no fix
  # registry_key { 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System':
  #   ensure => present,
  # }
  if $enforced {
    if $facts['operatingsystemmajrelease'] == '2012 R2' {
      registry_value { 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\MSAOptional':
        ensure => present,
        type   => dword,
        data   => '0x00000001',
      }
    }
  }

}
