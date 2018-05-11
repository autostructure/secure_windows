# This class manages V-15713
# This setting disables Microsoft Active Protection Service membership and reporting.
class secure_windows::stig::v15713 (
  Boolean $enforced = true,
) {
  if $enforced {

    registry::value { 'v15713':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\SpyNet',
      value => 'SpyNetReporting',
      type  => 'dword',
      data  => '0x00000000',
    }

  }
}
