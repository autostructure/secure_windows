# This class manages V-4112
# The system must be configured to disable the Internet Router Discovery Protocol (IRDP).
class secure_windows::stig::v4112 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v4112':
      key   => 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Tcpip\Parameters',
      value => 'PerformRouterDiscovery',
      type  => 'dword',
      data  => '0',
    }
  }
}
