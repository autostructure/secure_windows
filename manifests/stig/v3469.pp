# This class manages V-3469
# Group Policies must be refreshed in the background if the user is logged on.
class secure_windows::stig::v3469 (
  Boolean $enforced = true,
) {
  if $enforced {
    # registry::value { 'v3469':
    #   key   => 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\system',
    #   value => 'DisableBkGndGroupPolicy',
    #   type  => 'dword',
    #   data  => '0',
    # }
    registry_value { 'HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\system\DisableBkGndGroupPolicy':
      ensure => present,
      type   => dword,
      data   => '0x00000000',
    }
  }
}
