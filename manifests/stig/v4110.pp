# This class manages V-4110
# The system must be configured to prevent IP source routing.
class secure_windows::stig::v4110 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v4110':
      key   => 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Tcpip\Parameters',
      value => 'DisableIPSourceRouting',
      type  => 'dword',
      data  => '2',
    }
  }
}
