# This class manages V-4111
# The system must be configured to prevent Internet Control Message Protocol (ICMP) redirects
# from overriding Open Shortest Path First (OSPF) generated routes.
class secure_windows::stig::v4111 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v4111':
      key   => 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Tcpip\Parameters',
      value => 'EnableICMPRedirect',
      type  => 'dword',
      data  => '0',
    }
  }
}
