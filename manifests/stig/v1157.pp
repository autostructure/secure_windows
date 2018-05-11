#This class manages V-1157
#The Smart Card removal option must be configured to Force Logoff or Lock Workstation.
class secure_windows::stig::v1157 (
  Boolean $enforced = true,
  Enum['1','2'] $scremoveoption = '1',
) {
  if $enforced {
    # registry::value { 'v1157':
    #   key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon',
    #   value => 'scremoveoption',
    #   type  => 'string',
    #   data  => $scremoveoption,
    # }
    registry_value { 'HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\scremoveoption':
      ensure => present,
      type   => string,
      data   => $scremoveoption,
    }

  }
}
