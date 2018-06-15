#blah
#blah

class secure_windows::stig::v73523 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v73523_start':
      key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\mrxsmb10',
      value => 'Start',
      type  => 'dword',
      data  => '4',
    }
    registry::value { 'v73523_dependonservice':
      key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanWorkstation',
      value => 'DependOnService',
      type  => 'array',
      data  => ['Bowser', 'MRxSmb20', 'NSI'],
    }

  }
}
