# This class manages V-4116
# The system must be configured to ignore NetBIOS name release requests except from WINS servers.
class secure_windows::stig::v4116 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v4116':
      key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Netbt\Parameters',
      value => 'NoNameReleaseOnDemand',
      type  => 'dword',
      data  => '0x00000001',
    }
  }
}
