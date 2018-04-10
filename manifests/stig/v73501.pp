# V-73501
# Source routing must be configured to the highest protection level to prevent Internet Protocol (IP) source routing.
class secure_windows::stig::v73501 (
  Boolean $enforced = false,
) {
  if $enforced {
    # TODO: Install the MSS-Legacy custom templates included in the STIG package.
    # This policy setting requires the installation of the
    # MSS-Legacy custom templates included with the STIG package.
    # "MSS-Legacy.admx" and "MSS-Legacy.adml" must be copied to the
    # \Windows\PolicyDefinitions and \Windows\PolicyDefinitions\en-US
    # directories respectively.
    registry::value { 'v73501':
      key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters',
      value => 'DisableIPSourceRouting',
      type  => 'dword',
      data  => '0x00000002',
    }
  }
}
