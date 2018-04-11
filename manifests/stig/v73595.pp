# V-73595
# The Windows Remote Management (WinRM) client must not allow unencrypted traffic.
class secure_windows::stig::v73595 (
  Boolean $enforced = false,
) {

  if $enforced {

    registry::value { 'v73595':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client',
      value => 'AllowUnencryptedTraffic',
      type  => 'dword',
      data  => '0x00000000',
    }

  }

}
