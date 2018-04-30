# V-73807
# The Smart Card removal option must be configured to Force Logoff or Lock Workstation.
class secure_windows::stig::v73807 (
  Boolean $enforced = false,
  Enum['1','2'] $scremoveoption = '1',
) {

  if $enforced {

    registry::value { 'v73807':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon',
      value => 'scremoveoption',
      type  => 'string',
      data  => $scremoveoption,
    }

  }

}
