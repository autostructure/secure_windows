# V-73601
# The Windows Remote Management (WinRM) service must not allow unencrypted traffic.
class secure_windows::stig::v73601 (
  Boolean $enforced = false,
) {

  if $enforced {

    registry::value { 'v73601':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service',
      value => 'AllowUnencryptedTraffic',
      type  => 'dword',
      data  => '0x00000000',
    }

  }

}
