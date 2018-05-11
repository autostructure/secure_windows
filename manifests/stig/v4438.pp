# This class manages V-4438
# The system must limit how many times unacknowledged TCP data is retransmitted.
class secure_windows::stig::v4438 (
  Boolean $enforced = true,
) {
  if $enforced {
    # registry::value { 'v4438':
    #   key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters',
    #   value => 'TcpMaxDataRetransmissions',
    #   type  => 'dword',
    #   data  => '0x00000003',
    # }
    registry_value { 'HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\TcpMaxDataRetransmissions':
      ensure => present,
      type   => dword,
      data   => '0x00000003',
    }
  }
}
