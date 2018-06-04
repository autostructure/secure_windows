# This class manages V-21956
# IPv6 TCP data retransmissions must be configured to prevent resources from becoming exhausted.
class secure_windows::stig::v21956 (
  Boolean $enforced = true,
  ) {

  if $enforced {
    registry::value {'v21956':
      key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters',
      value => 'TcpMaxDataRetransmissions',
      type  => 'dword',
      data  => '3',
      }
    }
  }
