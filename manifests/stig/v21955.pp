# This class manages V-21955
# IPv6 source routing must be configured to the highest protection level.
class secure_windows::stig::v21955 (
  Boolean $enforced = true,
) {

  if $enforced {

    # This policy setting requires the installation of the MSS-Legacy
    # custom templates included with the STIG package.
    # "MSS-Legacy.admx" and "MSS-Legacy.adml" must be copied to the
    # \Windows\PolicyDefinitions and \Windows\PolicyDefinitions\en-US directories respectively.

    include ::secure_windows::administrative_template_msslegacy_installer

    registry::value { 'v21955':
      key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters',
      value => 'DisableIPSourceRouting',
      type  => 'dword',
      data  => '0x00000002',
    }

  }

}
