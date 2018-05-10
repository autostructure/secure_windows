#This class manages V-1165
#The computer account password must not be prevented from being reset.
class secure_windows::stig::v1165 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v1165':
      key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters',
      value => 'DisablePasswordChange',
      type  => 'dword',
      data  => '0x00000000',
    }

  }
}
