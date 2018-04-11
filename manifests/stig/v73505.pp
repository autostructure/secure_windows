# V-73505
# Windows Server 2016 must be configured to ignore NetBIOS name release requests except from WINS servers.
class secure_windows::stig::v73505 (
  Boolean $enforced = false,
) {

  if $enforced {

    # This policy setting requires the installation of the MSS-Legacy
    # custom templates included with the STIG package.
    # "MSS-Legacy.admx" and "MSS-Legacy.adml" must be copied to the
    # \Windows\PolicyDefinitions and \Windows\PolicyDefinitions\en-US directories respectively.

    include ::secure_windows::administrative_template_installation

    registry::value { 'v73505':
      key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Netbt\Parameters',
      value => 'NoNameReleaseOnDemand',
      type  => 'dword',
      data  => '0x00000001',
    }

  }

}
