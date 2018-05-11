# This class manages V-4113
# The system must be configured to limit how often keep-alive packets are sent.
class secure_windows::stig::v4113 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v4113':
      key   => 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Tcpip\Parameters',
      value => 'KeepAliveTime',
      type  => 'dword',
      data  => '300000',
    }
  }
}
