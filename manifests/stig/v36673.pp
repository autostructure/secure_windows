# This class manages V-36673
# IP stateless autoconfiguration limits state must be enabled.
class secure_windows::stig::v36673 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v36673':
      key   => 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Tcpip\Parameters',
      value => 'EnableIPAutoConfigurationLimits',
      type  => 'dword',
      data  => '0x00000001',
    }
  }
}
