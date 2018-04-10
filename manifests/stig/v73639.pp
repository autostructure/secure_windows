# V-73639
# The computer account password must not be prevented from being reset.
class secure_windows::stig::v73639 (
  Boolean $enforced = false,
) {

  if $enforced {

    registry::value { 'v73639':
      key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters',
      value => 'DisablePasswordChange',
      type  => 'dword',
      data  => '0x00000000',
    }

  }

}
