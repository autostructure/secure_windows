# V-73499
# Internet Protocol version 6 (IPv6) source routing must be configured to the highest protection level to prevent IP source routing.
class secure_windows::stig::v73499 (
  Boolean $enforced = false,
) {
    # This policy setting requires the installation of the SecGuide custom templates
    # included with the STIG package. "SecGuide.admx" and " SecGuide.adml"
    # must be copied to the \Windows\PolicyDefinitions and
    # \Windows\PolicyDefinitions\en-US directories respectively.
    registry::value { 'v73499':
      key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters',
      value => 'DisableIPSourceRouting',
      type  => 'dword',
      data  => '0x00000002',
    }
  }
}
