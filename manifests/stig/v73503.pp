# V-73503
# Source routing must be configured to the highest protection level to prevent Internet Protocol (IP) source routing.
class secure_windows::stig::v73503 (
  Boolean $enforced = false,
) {
  if $enforced {
    # TODO: Install the MSS-Legacy custom templates included in the STIG package.
    registry::value { 'v73503':
      key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters',
      value => 'EnableICMPRedirect',
      type  => 'dword',
      data  => '0x00000000',
    }
  }
}
